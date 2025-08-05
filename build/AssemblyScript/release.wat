(module
 (type $0 (func))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32 i32) (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32 i32 i32)))
 (type $6 (func (param i32 i32 i64)))
 (type $7 (func (param i32 i32 i32 i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/rt/tcms/pinSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/white (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/toSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/fromSpace (mut i32) (i32.const 0))
 (global $~lib/rt/tcms/total (mut i32) (i32.const 0))
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1440))
 (memory $0 1)
 (data $3 (i32.const 1116) "<")
 (data $3.1 (i32.const 1128) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $4 (i32.const 1180) "<")
 (data $4.1 (i32.const 1192) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00c\00m\00s\00.\00t\00s")
 (data $5 (i32.const 1244) "<")
 (data $5.1 (i32.const 1256) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
 (data $6 (i32.const 1308) "<")
 (data $6.1 (i32.const 1320) "\02\00\00\00*\00\00\00O\00b\00j\00e\00c\00t\00 \00a\00l\00r\00e\00a\00d\00y\00 \00p\00i\00n\00n\00e\00d")
 (data $7 (i32.const 1372) "<")
 (data $7.1 (i32.const 1384) "\02\00\00\00(\00\00\00O\00b\00j\00e\00c\00t\00 \00i\00s\00 \00n\00o\00t\00 \00p\00i\00n\00n\00e\00d")
 (data $8 (i32.const 1440) "\05\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\01\t")
 (export "qsort" (func $src/AssemblyScript/index/qsort))
 (export "garbageCollect" (func $src/AssemblyScript/index/garbageCollect))
 (export "__new" (func $~lib/rt/tcms/__new))
 (export "__pin" (func $~lib/rt/tcms/__pin))
 (export "__unpin" (func $~lib/rt/tcms/__unpin))
 (export "__collect" (func $~lib/rt/tcms/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (start $~start)
 (func $src/AssemblyScript/index/qsort_part (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.load offset=4
  local.get $2
  local.tee $3
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $5
  local.get $1
  local.tee $2
  local.set $4
  loop $for-loop|0
   local.get $3
   local.get $4
   i32.gt_s
   if
    local.get $0
    i32.load offset=4
    local.tee $7
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    local.tee $8
    i32.load
    local.tee $6
    local.get $5
    i32.le_s
    if
     local.get $8
     local.get $7
     local.get $2
     i32.const 2
     i32.shl
     local.tee $7
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.load offset=4
     local.get $7
     i32.add
     local.get $6
     i32.store
     local.get $2
     i32.const 1
     i32.add
     local.set $2
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=4
  local.tee $4
  local.get $3
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $4
  i32.add
  i32.load
  i32.store
  local.get $0
  i32.load offset=4
  local.get $6
  i32.add
  local.get $5
  i32.store
  local.get $2
  i32.const 1
  i32.sub
  local.tee $4
  local.get $1
  i32.gt_s
  if
   local.get $0
   local.get $1
   local.get $4
   call $src/AssemblyScript/index/qsort_part
  end
  local.get $2
  i32.const 1
  i32.add
  local.tee $1
  local.get $3
  i32.lt_s
  if
   local.get $0
   local.get $1
   local.get $3
   call $src/AssemblyScript/index/qsort_part
  end
 )
 (func $src/AssemblyScript/index/qsort (param $0 i32) (result i32)
  local.get $0
  i32.const 0
  local.get $0
  i32.load offset=8
  i32.const 2
  i32.shr_u
  i32.const 1
  i32.sub
  call $src/AssemblyScript/index/qsort_part
  local.get $0
 )
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  i32.const -4
  i32.and
  local.tee $3
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $3
   local.get $3
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.clz
   i32.sub
   local.tee $4
   i32.const 7
   i32.sub
   local.set $2
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.set $4
  local.get $1
  i32.load offset=8
  local.set $5
  local.get $1
  i32.load offset=4
  local.tee $3
  if
   local.get $3
   local.get $5
   i32.store offset=8
  end
  local.get $5
  if
   local.get $5
   local.get $3
   i32.store offset=4
  end
  local.get $1
  local.get $0
  local.get $2
  i32.const 4
  i32.shl
  local.get $4
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.tee $1
  i32.load offset=96
  i32.eq
  if
   local.get $1
   local.get $5
   i32.store offset=96
   local.get $5
   i32.eqz
   if
    local.get $0
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    local.tee $1
    i32.load offset=4
    i32.const -2
    local.get $4
    i32.rotl
    i32.and
    local.set $3
    local.get $1
    local.get $3
    i32.store offset=4
    local.get $3
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const -2
     local.get $2
     i32.rotl
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.const 4
  i32.add
  local.tee $6
  local.get $1
  i32.load
  local.tee $3
  i32.const -4
  i32.and
  i32.add
  local.tee $4
  i32.load
  local.tee $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.get $4
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $3
   i32.const 4
   i32.add
   local.get $2
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
   local.get $6
   local.get $1
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $4
   i32.load
   local.set $2
  end
  local.get $3
  i32.const 2
  i32.and
  if
   local.get $1
   i32.const 4
   i32.sub
   i32.load
   local.tee $1
   i32.load
   local.set $6
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/removeBlock
   local.get $1
   local.get $6
   i32.const 4
   i32.add
   local.get $3
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   i32.store
  end
  local.get $4
  local.get $2
  i32.const 2
  i32.or
  i32.store
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.const -4
  i32.and
  local.tee $2
  i32.const 256
  i32.lt_u
  if (result i32)
   local.get $2
   i32.const 4
   i32.shr_u
  else
   i32.const 31
   i32.const 1073741820
   local.get $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $2
   i32.clz
   i32.sub
   local.tee $3
   i32.const 7
   i32.sub
   local.set $5
   local.get $2
   local.get $3
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
  end
  local.tee $2
  local.get $5
  i32.const 4
  i32.shl
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $3
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $3
  i32.store offset=8
  local.get $3
  if
   local.get $3
   local.get $1
   i32.store offset=4
  end
  local.get $0
  local.get $5
  i32.const 4
  i32.shl
  local.get $2
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $5
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.get $5
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $0
  i32.load offset=4
  i32.const 1
  local.get $2
  i32.shl
  i32.or
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $1
  local.get $0
  i32.load offset=1568
  local.tee $3
  if
   local.get $1
   i32.const 16
   i32.sub
   local.tee $5
   local.get $3
   i32.eq
   if
    local.get $3
    i32.load
    local.set $4
    local.get $5
    local.set $1
   end
  end
  local.get $2
  i32.wrap_i64
  i32.const -16
  i32.and
  local.get $1
  i32.sub
  local.tee $3
  i32.const 20
  i32.lt_u
  if
   return
  end
  local.get $1
  local.get $4
  i32.const 2
  i32.and
  local.get $3
  i32.const 8
  i32.sub
  local.tee $3
  i32.const 1
  i32.or
  i32.or
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.add
  local.get $3
  i32.add
  local.tee $3
  i32.const 2
  i32.store
  local.get $0
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
 )
 (func $~lib/rt/tlsf/initialize
  (local $0 i32)
  (local $1 i32)
  memory.size
  local.tee $0
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
   local.get $0
   i32.sub
   memory.grow
   i32.const 0
   i32.lt_s
  else
   i32.const 0
  end
  if
   unreachable
  end
  i32.const 1472
  i32.const 0
  i32.store
  i32.const 3040
  i32.const 0
  i32.store
  loop $for-loop|0
   local.get $1
   i32.const 23
   i32.lt_u
   if
    local.get $1
    i32.const 2
    i32.shl
    i32.const 1472
    i32.add
    i32.const 0
    i32.store offset=4
    i32.const 0
    local.set $0
    loop $for-loop|1
     local.get $0
     i32.const 16
     i32.lt_u
     if
      local.get $1
      i32.const 4
      i32.shl
      local.get $0
      i32.add
      i32.const 2
      i32.shl
      i32.const 1472
      i32.add
      i32.const 0
      i32.store offset=96
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      br $for-loop|1
     end
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 1472
  i32.const 3044
  memory.size
  i64.extend_i32_s
  i64.const 16
  i64.shl
  call $~lib/rt/tlsf/addMemory
  i32.const 1472
  global.set $~lib/rt/tlsf/ROOT
 )
 (func $~lib/rt/tcms/__collect
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/tcms/white
  i32.const 1120
  i32.load
  local.tee $0
  i32.const 3
  i32.and
  i32.eq
  if
   block $__inlined_func$~lib/rt/tcms/Object#unlink$3
    local.get $0
    i32.const -4
    i32.and
    local.tee $0
    i32.eqz
    if
     i32.const 1124
     i32.load
     drop
     br $__inlined_func$~lib/rt/tcms/Object#unlink$3
    end
    local.get $0
    i32.const 1124
    i32.load
    local.tee $1
    i32.store offset=8
    local.get $1
    local.get $0
    local.get $1
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
   end
   global.get $~lib/rt/tcms/toSpace
   local.tee $0
   i32.load offset=8
   local.set $1
   i32.const 1120
   local.get $0
   global.get $~lib/rt/tcms/white
   i32.eqz
   i32.or
   i32.store
   i32.const 1124
   local.get $1
   i32.store
   local.get $1
   local.get $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 1116
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 1116
   i32.store offset=8
  end
  global.get $~lib/rt/tcms/white
  i32.const 1312
  i32.load
  local.tee $0
  i32.const 3
  i32.and
  i32.eq
  if
   block $__inlined_func$~lib/rt/tcms/Object#unlink$30
    local.get $0
    i32.const -4
    i32.and
    local.tee $0
    i32.eqz
    if
     i32.const 1316
     i32.load
     drop
     br $__inlined_func$~lib/rt/tcms/Object#unlink$30
    end
    local.get $0
    i32.const 1316
    i32.load
    local.tee $1
    i32.store offset=8
    local.get $1
    local.get $0
    local.get $1
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
   end
   global.get $~lib/rt/tcms/toSpace
   local.tee $0
   i32.load offset=8
   local.set $1
   i32.const 1312
   local.get $0
   global.get $~lib/rt/tcms/white
   i32.eqz
   i32.or
   i32.store
   i32.const 1316
   local.get $1
   i32.store
   local.get $1
   local.get $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 1308
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 1308
   i32.store offset=8
  end
  global.get $~lib/rt/tcms/white
  i32.const 1376
  i32.load
  local.tee $0
  i32.const 3
  i32.and
  i32.eq
  if
   block $__inlined_func$~lib/rt/tcms/Object#unlink$31
    local.get $0
    i32.const -4
    i32.and
    local.tee $0
    i32.eqz
    if
     i32.const 1380
     i32.load
     drop
     br $__inlined_func$~lib/rt/tcms/Object#unlink$31
    end
    local.get $0
    i32.const 1380
    i32.load
    local.tee $1
    i32.store offset=8
    local.get $1
    local.get $0
    local.get $1
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
   end
   global.get $~lib/rt/tcms/toSpace
   local.tee $0
   i32.load offset=8
   local.set $1
   i32.const 1376
   local.get $0
   global.get $~lib/rt/tcms/white
   i32.eqz
   i32.or
   i32.store
   i32.const 1380
   local.get $1
   i32.store
   local.get $1
   local.get $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 1372
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 1372
   i32.store offset=8
  end
  global.get $~lib/rt/tcms/pinSpace
  local.tee $1
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.ne
   if
    local.get $0
    i32.load offset=4
    drop
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  global.get $~lib/rt/tcms/white
  i32.eqz
  global.get $~lib/rt/tcms/toSpace
  local.tee $3
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|1
   local.get $0
   local.get $3
   i32.ne
   if
    local.get $0
    i32.load offset=4
    drop
    local.get $0
    i32.const 20
    i32.add
    call $~lib/rt/__visit_members
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.set $0
    br $while-continue|1
   end
  end
  global.get $~lib/rt/tcms/fromSpace
  local.tee $4
  i32.load offset=4
  i32.const -4
  i32.and
  local.set $0
  loop $while-continue|2
   local.get $0
   local.get $4
   i32.ne
   if
    local.get $0
    i32.load offset=4
    i32.const -4
    i32.and
    local.get $0
    i32.const 1464
    i32.lt_u
    if
     local.get $0
     i32.const 0
     i32.store offset=4
     local.get $0
     i32.const 0
     i32.store offset=8
    else
     global.get $~lib/rt/tcms/total
     local.get $0
     i32.load
     i32.const -4
     i32.and
     i32.const 4
     i32.add
     i32.sub
     global.set $~lib/rt/tcms/total
     local.get $0
     i32.const 4
     i32.add
     local.tee $0
     i32.const 1464
     i32.ge_u
     if
      global.get $~lib/rt/tlsf/ROOT
      i32.eqz
      if
       call $~lib/rt/tlsf/initialize
      end
      local.get $0
      i32.const 4
      i32.sub
      local.set $5
      local.get $0
      i32.const 15
      i32.and
      i32.const 1
      local.get $0
      select
      i32.eqz
      if
       local.get $5
       i32.load
       drop
      end
      local.get $5
      local.get $5
      i32.load
      i32.const 1
      i32.or
      i32.store
      global.get $~lib/rt/tlsf/ROOT
      local.get $5
      call $~lib/rt/tlsf/insertBlock
     end
    end
    local.set $0
    br $while-continue|2
   end
  end
  local.get $4
  local.get $4
  i32.store offset=4
  local.get $4
  local.get $4
  i32.store offset=8
  local.get $3
  global.set $~lib/rt/tcms/fromSpace
  local.get $4
  global.set $~lib/rt/tcms/toSpace
  global.set $~lib/rt/tcms/white
 )
 (func $src/AssemblyScript/index/garbageCollect
  call $~lib/rt/tcms/__collect
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $1
  else
   local.get $1
   i32.const 536870910
   i32.lt_u
   if
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
    local.set $1
   end
   local.get $1
   i32.const 31
   local.get $1
   i32.clz
   i32.sub
   local.tee $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 16
   i32.xor
   local.set $1
   local.get $2
   i32.const 7
   i32.sub
   local.set $2
  end
  local.get $0
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const -1
  local.get $1
  i32.shl
  i32.and
  local.tee $1
  if (result i32)
   local.get $0
   local.get $1
   i32.ctz
   local.get $2
   i32.const 4
   i32.shl
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
  else
   local.get $0
   i32.load
   i32.const -1
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.tee $1
   if (result i32)
    local.get $0
    local.get $0
    local.get $1
    i32.ctz
    local.tee $0
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.ctz
    local.get $0
    i32.const 4
    i32.shl
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
   else
    i32.const 0
   end
  end
 )
 (func $~lib/rt/tcms/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1136
   i32.const 1200
   i32.const 125
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/tlsf/ROOT
  i32.eqz
  if
   call $~lib/rt/tlsf/initialize
  end
  global.get $~lib/rt/tlsf/ROOT
  local.set $4
  local.get $0
  i32.const 16
  i32.add
  local.tee $2
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1136
   i32.const 1264
   i32.const 461
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  local.get $2
  i32.const 12
  i32.le_u
  if (result i32)
   i32.const 12
  else
   local.get $2
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
  end
  local.tee $5
  call $~lib/rt/tlsf/searchBlock
  local.tee $2
  i32.eqz
  if
   memory.size
   local.tee $2
   local.get $5
   i32.const 256
   i32.ge_u
   if (result i32)
    local.get $5
    i32.const 536870910
    i32.lt_u
    if (result i32)
     local.get $5
     i32.const 1
     i32.const 27
     local.get $5
     i32.clz
     i32.sub
     i32.shl
     i32.add
     i32.const 1
     i32.sub
    else
     local.get $5
    end
   else
    local.get $5
   end
   i32.const 4
   local.get $4
   i32.load offset=1568
   local.get $2
   i32.const 16
   i32.shl
   i32.const 4
   i32.sub
   i32.ne
   i32.shl
   i32.add
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $3
   local.get $2
   local.get $3
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $3
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
   local.get $4
   local.get $2
   i32.const 16
   i32.shl
   memory.size
   i64.extend_i32_s
   i64.const 16
   i64.shl
   call $~lib/rt/tlsf/addMemory
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/searchBlock
   local.set $2
  end
  local.get $2
  i32.load
  drop
  local.get $4
  local.get $2
  call $~lib/rt/tlsf/removeBlock
  local.get $2
  i32.load
  local.tee $3
  i32.const -4
  i32.and
  local.get $5
  i32.sub
  local.tee $6
  i32.const 16
  i32.ge_u
  if
   local.get $2
   local.get $5
   local.get $3
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $5
   i32.add
   local.tee $3
   local.get $6
   i32.const 4
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $4
   local.get $3
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $2
   local.get $3
   i32.const -2
   i32.and
   i32.store
   local.get $2
   i32.const 4
   i32.add
   local.get $2
   i32.load
   i32.const -4
   i32.and
   i32.add
   local.tee $3
   local.get $3
   i32.load
   i32.const -3
   i32.and
   i32.store
  end
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  global.get $~lib/rt/tcms/fromSpace
  local.tee $0
  i32.load offset=8
  local.set $1
  local.get $2
  local.get $0
  global.get $~lib/rt/tcms/white
  i32.or
  i32.store offset=4
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $1
  local.get $2
  local.get $1
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  global.get $~lib/rt/tcms/total
  local.get $2
  i32.load
  i32.const -4
  i32.and
  i32.const 4
  i32.add
  i32.add
  global.set $~lib/rt/tcms/total
  local.get $2
  i32.const 20
  i32.add
 )
 (func $~lib/rt/tcms/__pin (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  if
   local.get $0
   i32.const 20
   i32.sub
   local.tee $1
   i32.load offset=4
   i32.const 3
   i32.and
   i32.const 3
   i32.eq
   if
    i32.const 1328
    i32.const 1200
    i32.const 181
    i32.const 7
    call $~lib/builtins/abort
    unreachable
   end
   block $__inlined_func$~lib/rt/tcms/Object#unlink$1
    local.get $1
    i32.load offset=4
    i32.const -4
    i32.and
    local.tee $2
    i32.eqz
    if
     local.get $1
     i32.load offset=8
     drop
     br $__inlined_func$~lib/rt/tcms/Object#unlink$1
    end
    local.get $2
    local.get $1
    i32.load offset=8
    local.tee $3
    i32.store offset=8
    local.get $3
    local.get $2
    local.get $3
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
   end
   global.get $~lib/rt/tcms/pinSpace
   local.tee $2
   i32.load offset=8
   local.set $3
   local.get $1
   local.get $2
   i32.const 3
   i32.or
   i32.store offset=4
   local.get $1
   local.get $3
   i32.store offset=8
   local.get $3
   local.get $1
   local.get $3
   i32.load offset=4
   i32.const 3
   i32.and
   i32.or
   i32.store offset=4
   local.get $2
   local.get $1
   i32.store offset=8
  end
  local.get $0
 )
 (func $~lib/rt/tcms/__unpin (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   return
  end
  local.get $0
  i32.const 20
  i32.sub
  local.tee $0
  i32.load offset=4
  i32.const 3
  i32.and
  i32.const 3
  i32.ne
  if
   i32.const 1392
   i32.const 1200
   i32.const 195
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  block $__inlined_func$~lib/rt/tcms/Object#unlink$2
   local.get $0
   i32.load offset=4
   i32.const -4
   i32.and
   local.tee $1
   i32.eqz
   if
    local.get $0
    i32.load offset=8
    drop
    br $__inlined_func$~lib/rt/tcms/Object#unlink$2
   end
   local.get $1
   local.get $0
   i32.load offset=8
   local.tee $2
   i32.store offset=8
   local.get $2
   local.get $1
   local.get $2
   i32.load offset=4
   i32.const 3
   i32.and
   i32.or
   i32.store offset=4
  end
  global.get $~lib/rt/tcms/fromSpace
  local.tee $1
  i32.load offset=8
  local.set $2
  local.get $0
  local.get $1
  global.get $~lib/rt/tcms/white
  i32.or
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $2
  local.get $0
  local.get $2
  i32.load offset=4
  i32.const 3
  i32.and
  i32.or
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=8
 )
 (func $~lib/rt/__visit_members (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  block $folding-inner0
   block $invalid
    block $~lib/string/String
     block $~lib/arraybuffer/ArrayBuffer
      block $~lib/object/Object
       local.get $0
       i32.const 8
       i32.sub
       i32.load
       br_table $~lib/object/Object $~lib/arraybuffer/ArrayBuffer $~lib/string/String $folding-inner0 $folding-inner0 $invalid
      end
      return
     end
     return
    end
    return
   end
   unreachable
  end
  local.get $0
  i32.load
  local.tee $0
  if
   global.get $~lib/rt/tcms/white
   local.get $0
   i32.const 20
   i32.sub
   local.tee $0
   i32.load offset=4
   local.tee $1
   i32.const 3
   i32.and
   i32.eq
   if
    block $__inlined_func$~lib/rt/tcms/Object#unlink$3
     local.get $1
     i32.const -4
     i32.and
     local.tee $1
     i32.eqz
     if
      local.get $0
      i32.load offset=8
      drop
      br $__inlined_func$~lib/rt/tcms/Object#unlink$3
     end
     local.get $1
     local.get $0
     i32.load offset=8
     local.tee $2
     i32.store offset=8
     local.get $2
     local.get $1
     local.get $2
     i32.load offset=4
     i32.const 3
     i32.and
     i32.or
     i32.store offset=4
    end
    global.get $~lib/rt/tcms/toSpace
    local.tee $1
    i32.load offset=8
    local.set $2
    local.get $0
    local.get $1
    global.get $~lib/rt/tcms/white
    i32.eqz
    i32.or
    i32.store offset=4
    local.get $0
    local.get $2
    i32.store offset=8
    local.get $2
    local.get $0
    local.get $2
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
    local.get $1
    local.get $0
    i32.store offset=8
   end
  end
 )
 (func $~start
  i32.const 1028
  i32.const 1024
  i32.store
  i32.const 1032
  i32.const 1024
  i32.store
  i32.const 1024
  global.set $~lib/rt/tcms/pinSpace
  i32.const 1060
  i32.const 1056
  i32.store
  i32.const 1064
  i32.const 1056
  i32.store
  i32.const 1056
  global.set $~lib/rt/tcms/toSpace
  i32.const 1092
  i32.const 1088
  i32.store
  i32.const 1096
  i32.const 1088
  i32.store
  i32.const 1088
  global.set $~lib/rt/tcms/fromSpace
 )
)
