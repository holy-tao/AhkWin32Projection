#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

; TYPEDESC and ARRAYDESC are mutually recursive: ARRAYDESC embeds TYPEDESC by value, and
; TYPEDESC has a pointer back to ARRAYDESC. Importing either one used to crash at load with
; "Cannot add typed property" because evaluating ARRAYDESC.Ptr during TYPEDESC's class init
; deadlocked against ARRAYDESC being mid-construction. The generator now breaks the cycle by
; emitting the pointer field (lpadesc) as a lazy accessor over a backing IntPtr. Simply
; importing these files is itself the load-time regression test.
#Import "../Windows/Win32/System/Com/TYPEDESC.ahk" { TYPEDESC }
#Import "../Windows/Win32/System/Ole/ARRAYDESC.ahk" { ARRAYDESC }

/**
 * Regression tests for cyclic struct pointer fields (CyclicPointerBreaker).
 */
class CyclicStructTests {

    class LazyCyclicPointer {

        /**
         * The cluster loads at all: the classes initialized without the fatal
         * "Cannot add typed property" load error that the cycle used to cause.
         */
        Cluster_Loads_WithoutFatalInitError() {
            Yunit.Assert(TYPEDESC is Class)
            Yunit.Assert(ARRAYDESC is Class)
        }

        /**
         * Breaking the cycle must not change the struct's layout.
         */
        LazyPointer_DoesNotChange_StructSize() {
            Assert.Equals(TYPEDESC().Size, 16)
        }

        /**
         * An unassigned cyclic pointer reads as a null pointer (unset).
         */
        CyclicPointer_DefaultsTo_Null() {
            td := TYPEDESC()
            Yunit.Assert((td.lpadesc ?? 0) == 0, "Expected default lpadesc to be a null pointer")
        }

        /**
         * Assigning a boxed struct and reading it back yields a boxed pointer of the
         * correct type whose address matches — i.e. the lazy accessor round-trips.
         */
        CyclicPointer_RoundTrips_BoxedPointer() {
            td := TYPEDESC()
            ad := ARRAYDESC()

            td.lpadesc := ad
            got := td.lpadesc

            Yunit.Assert(got is ARRAYDESC, "Expected lpadesc to read back as an ARRAYDESC")
            Assert.Equals(got.Ptr, ad.Ptr)
        }

        /**
         * Assigning unset clears the pointer back to null.
         */
        CyclicPointer_AssigningUnset_ClearsToNull() {
            td := TYPEDESC()
            td.lpadesc := ARRAYDESC()
            td.lpadesc := unset

            Yunit.Assert((td.lpadesc ?? 0) == 0, "Expected assigning unset to clear lpadesc to null")
        }
    }
}
