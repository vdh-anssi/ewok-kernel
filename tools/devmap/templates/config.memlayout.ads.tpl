------------------------------------------------------------------------
----      Copyright (c) 15-01-2018, ANSSI
----      All rights reserved.
----
---- This file is autogenerated by ./kernel/tools/devmap/gen_app_metainfos.pl
----
---- This file describes the applications layout and permissions for
---- the current build.
---- Please see the above script for details.
----
--------------------------------------------------------------------------

--
-- This file is autogenerated ! Don't try to update it as it is
-- regenerated each time the kernel is built !
--



with interfaces;        use interfaces;
with types;             use types;
with ewok.tasks_shared; use ewok.tasks_shared;
with m4;
with m4.mpu; use m4.mpu;

with config.applications; use config.applications;


package config.memlayout is

   subtype t_mpu_slot_range is unsigned_8 range 1 .. 8;

   -- This structure defines per application memory layout informations that
   -- are SoC specific
   type t_application_memlayout is record
      flash_slot_start    : t_mpu_slot_range;
      flash_slot_number   : t_mpu_slot_range;
      ram_slot_start      : t_mpu_slot_range;
      ram_slot_number     : t_mpu_slot_range;
      -- RAM free space is the amount of free space *after* the HEAP declared by the task
      ram_free_space      : unsigned_32;
   end record;

   -- This structure defines kernel global memory layout informations that
   -- are SoC specific
   type t_kernel_region is record
      flash_memory_addr        : system_address;
      flash_memory_size        : application_section_size;
      flash_memory_region_size : m4.mpu.t_region_size;
      ram_memory_addr          : system_address;
      ram_memory_size          : application_section_size;
      ram_memory_region_size   : m4.mpu.t_region_size;
   end record;

   -- This structure defines userspace global memory layout informations that
   -- are SoC specific
   type t_applications_region is record
      flash_memory_addr        : system_address;
      flash_memory_size        : application_section_size;
      flash_memory_region_size : m4.mpu.t_region_size;
      ram_memory_addr          : system_address;
      ram_memory_size          : application_section_size;
      ram_memory_region_size   : m4.mpu.t_region_size;
   end record;

   list : constant array (t_real_task_id'range) of t_application_memlayout := (
