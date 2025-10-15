#Requires AutoHotkey v2.0

#Include ./Yunit/Yunit.ahk
#Include ./YunitExtensions/Assert.ahk

#Include ../Windows/Win32/Foundation/Apis.ahk
#Include ../Windows/Win32/Foundation/SYSTEMTIME.ahk
#Include ../Windows/Win32/System/SystemInformation/Apis.ahk
#Include ../Windows/Win32/UI/WindowsAndMessaging/Apis.ahk
#include ../Windows/Win32/System/Memory/Apis.ahk
#Include ../Windows/Win32/Networking/WinSock/Apis.ahk
#Include ../Windows/Win32/System/Com/Urlmon/Apis.ahk
#Include ../Windows/Win32/Security/Authentication/Identity/Apis.ahk
#Include ../Windows/Win32/UI/Shell/Apis.ahk

class GeneratedApiSmokeTests {

    /**
     * Tests for string parameters and return values. In general, we should be abstracting
     * away string encoding and memory management as much as possible while still allowing
     * users to use e.g. pointers to strings on the heap for performance reasons.
     * 
     * So parameters MUST accept:
     *  - Buffers and buffer-like objects
     *  - Raw pointers (that is, pure Integers)
     *  - Variables containing strings
     *  - String literals
     */
    class String{

        Params_Always_AcceptStringLiterals() {
            msgNum := WindowsAndMessaging.RegisterWindowMessageW("test window message") ; Shouldn't throw
            Yunit.Assert(msgNum != 0, "RegisterWindowMessageW with string literal failed")
        }

        Params_Always_AcceptStringPointers(){
            ptr := StrPtr("test window message ooglyboogly")
            msgNum := WindowsAndMessaging.RegisterWindowMessageW(ptr)   ; Shouldn't throw
            Yunit.Assert(msgNum != 0, "RegisterWindowMessageW with string pointer failed")
        }

        Params_Always_AcceptBuffers(){
            buf := Buffer(32)
            StrPut("16-Character Str", buf, 16, "UTF-16")

            ; This should not throw
            charsProcessed := WindowsAndMessaging.CharUpperBuffW(buf, 16)

            upper := StrGet(buf, 16, "UTF-16")
            
            Yunit.Assert(upper == "16-CHARACTER STR", Format("Expected '16-CHARACTER STR' but got '{1}'", upper))
            Yunit.Assert(charsProcessed == 16, Format("Expected 16 but got '{1}'", charsProcessed))
        }

        Params_Always_AcceptBufferLikeObjects(){
            bfLikeObj := BufferLike(32)

            StrPut("16-Character Str", bfLikeObj, 16, "UTF-16")

            ; This is the real test - this should not throw
            charsProcessed := WindowsAndMessaging.CharUpperBuffW(bfLikeObj, 16)

            upper := StrGet(bfLikeObj, 16, "UTF-16")

            Yunit.Assert(upper == "16-CHARACTER STR", Format("Expected '16-CHARACTER STR' but got '{1}'", upper))
            Yunit.Assert(charsProcessed == 16, Format("Expected 16 but got '{1}'", charsProcessed)) 
        }
    }

    /**
     * We should be parsing metadata and throwing errors WHEN possible
     */
    class ErrorChecking {

        /**
         * Check that a method which returns an HRESULT but doesn't set LastError 
         * throws appropriately
         * These are more common in COM interface implementations than native code
         */
        HRESULTReturningMethods_OnError_ThrowOSErrors(){
            Assert.Throws((*) => Urlmon.UrlMkSetSessionOption(1, 0, -1), OSError)
        }

        /**
         * Methods which set LastError should check it after executing the DllCall and
         * throw if it's anything but S_OK (0), unless either the `[CanReturnMultipleSuccessValues]`
         * or `[CanReturnErrorsAsSuccess]` attribute is present
         */
        LastErrorSettingMethods_OnError_ThrowOSError(){
            Assert.Throws((*) => WindowsAndMessaging.LoadMenuW(0, 0), OSError)
        }

        ; //TODO test for [CanReturnMultipleSuccessValues] (these are mostly (all)? COM methods)

        ; //TODO test for [CanReturnErrorsAsSuccess] (these are mostly (all)? COM methods)

        /**
         * Methods not decorated with either [PreserveSig] or [SetLastError] should never throw
         * errors, even if they fail
         */
        NoPreserveSig_NoSetLastError_Never_ThrowsError(){
            res := WinSock.WSCUnInstallNameSpace(0)     ; Will fail but should not throw
            Yunit.Assert(res != 0)
        }
    }

    /**
     * Methods which take pointers to primitives (like int* or uint*, etc) should accept
     * a VarRef pass it in such a way that DllCall updates it automatically.
     */
    PrimitivePointerParams_WhenPassedVarRef_UpdateVarRef(){
        SystemInformation.GetPhysicallyInstalledSystemMemory(&memSize := 0)

        ; AHK has no native support for unsigned 64-bit ints so this might not actually be positive
        Yunit.Assert(memSize != 0)  
    }

    /**
     * Smoke tests for a few cases where the entry point for a method is not equal to its
     * name. Note RtlEncryptMemory and RtlDecryptMemory are deprecated
     * 
     * https://learn.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.dllimportattribute.entrypoint?view=net-9.0
     */
    class EntryPointDiffersFromName {
        /**
         * Test for a method with an alternative entry point where the alternative is a name
         */
        AltName_EntryPoint_Works(){
            testBuf := Buffer(8, 0)
            result := Identity.RtlGenRandom(testBuf, testBuf.size)

            Yunit.Assert(result == true)
            Yunit.Assert(NumGet(testBuf, "Int") != 0)
        }

        /**
         * Test for a method with an alternative entry point where the alternative is
         * an ordinal
         */
        Ordinal_EntryPoint_Works(){
            result := Shell.FileIconInit(true)

            Yunit.Assert(result == true)
        }

        /**
         * Shell32 is not in AHK's standard dll list, but Windows loads it for all GUI processes
         * early in their lifecycles. Since all AHK processes are GUI processes, they'll all have
         * the dll and we can't use FileIconInit as a test case. Unfortunately it's the only API
         * exported by ordinal in the metadata, so this is a no-op for now
         */         
        Ordinal_EntryPoint_WithLibraryUnloaded_UnloadsItAfter(){
            ;? Maybe in the future
        }

        Ordinal_EntryPoint_WithLibraryAlreadyLoaded_DoesNotUnloadIt(){
            hModuleBefore := DllCall("LoadLibraryW", "str", "shell32.dll", "ptr")

            this.Ordinal_EntryPoint_Works()

            ; This is an imperfect test because other tests could be using Shell32. But without reading the
            ; PEB, it's the best we've got
            ; https://stackoverflow.com/questions/3553231/how-to-check-dlls-reference-count-how-to-know-where-the-dll-was-loaded
            hModuleAfter := DllCall("GetModuleHandleW", "str", "shell32.dll", "ptr")
            Yunit.Assert(hModuleAfter == hModuleBefore, 
                Format("Expected Shell32.dll to be loaded at 0x{1:0X}, but it exists at 0x{1:0X}", hModuleBefore, hModuleAfter))
        }
    }

    /**
     * Some tests for handles. Requirements:
     *  - Apis that accept handles should automatically dereference them and accept raw pointers as well
     *  - Apis which return handles should always wrap them in the appropriate type
     */
    class Handles{
        HandleReturningApis_Always_WrapReturnValues(){
            nonNullTest := Foundation.SysAllocString("Test string")
            nullTest := Foundation.SysAllocString(0)

            Assert.IsType(nonNullTest, BSTR)
            Yunit.Assert(nonNullTest.Value != 0, nonNullTest.Value)
            Yunit.Assert(nonNullTest.ptr != 0, nonNullTest.ptr)

            Assert.IsType(nullTest, BSTR)
            Yunit.Assert(nullTest.Value == 0, nullTest.Value)
            Yunit.Assert(nullTest.ptr != 0, nullTest.ptr)
        }

        ApisWithHandleParams_Always_AcceptAndDereferenceHandles(){
            str := Foundation.SysAllocString("Test")
            Foundation.SysFreeString(str)   ; will segfault (exit with code=3221226356) if passed an invalid non-null handle
        }

        ApisWithHandleParams_Always_AcceptRawIntegers(){
            str := Foundation.SysAllocString("Test")
            handleRaw := str.Value
            Foundation.SysFreeString(handleRaw)   ; will segfault (exit with code=3221226356) if passed an invalid non-null handle
        }
    }
}

/**
 * Test buffer-like object class - mostly exists to free iteslf automatically
 */
class BufferLike {

    static hProcHeap := Memory.GetProcessHeap()

    __New(size){
        this.ptr := Memory.HeapAlloc(BufferLike.hProcHeap, 0, size)
        this.size := size
    }

    __Delete(){
        Memory.HeapFree(BufferLike.hProcHeap, 0, this.ptr)
    }
}