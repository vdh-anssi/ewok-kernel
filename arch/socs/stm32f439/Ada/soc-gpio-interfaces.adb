--
-- Copyright 2018 The wookey project team <wookey@ssi.gouv.fr>
--   - Ryad     Benadjila
--   - Arnauld  Michelizza
--   - Mathieu  Renard
--   - Philippe Thierry
--   - Philippe Trebuchet
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
--     Unless required by applicable law or agreed to in writing, software
--     distributed under the License is distributed on an "AS IS" BASIS,
--     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--     See the License for the specific language governing permissions and
--     limitations under the License.
--
--

with soc.rcc;


package body soc.gpio.interfaces
   with spark_mode => off
is

   function configure
     (port     : in  unsigned_8;
      pin      : in  unsigned_8;
      mode     : in  t_pin_mode;
      otype    : in  t_pin_output_type;
      ospeed   : in  t_pin_output_speed;
      pupd     : in  t_pin_pupd;
      af       : in  t_pin_alt_func)
      return types.c.t_retval
   is
      gpio_port : constant t_gpio_port_index := t_gpio_port_index'val (port);
      gpio_pin  : constant t_gpio_pin_index  := t_gpio_pin_index'val (pin);
   begin

      if not gpio_port'valid then
         return types.c.FAILURE;
      end if;

      if not gpio_pin'valid then
         return types.c.FAILURE;
      end if;

      case gpio_port is
         when GPIO_PA => soc.rcc.RCC.AHB1.GPIOAEN := true;
         when GPIO_PB => soc.rcc.RCC.AHB1.GPIOBEN := true;
         when GPIO_PC => soc.rcc.RCC.AHB1.GPIOCEN := true;
         when GPIO_PD => soc.rcc.RCC.AHB1.GPIODEN := true;
         when GPIO_PE => soc.rcc.RCC.AHB1.GPIOEEN := true;
         when GPIO_PF => soc.rcc.RCC.AHB1.GPIOFEN := true;
         when GPIO_PG => soc.rcc.RCC.AHB1.GPIOGEN := true;
         when GPIO_PH => soc.rcc.RCC.AHB1.GPIOHEN := true;
         when GPIO_PI => soc.rcc.RCC.AHB1.GPIOIEN := true;
      end case;

      soc.gpio.set_mode (gpio_port, gpio_pin, mode);
      soc.gpio.set_type (gpio_port, gpio_pin, otype);
      soc.gpio.set_speed (gpio_port, gpio_pin, ospeed);
      soc.gpio.set_pupd (gpio_port, gpio_pin, pupd);
      soc.gpio.set_af (gpio_port, gpio_pin, af);

      return types.c.SUCCESS;
   end configure;


end soc.gpio.interfaces;
