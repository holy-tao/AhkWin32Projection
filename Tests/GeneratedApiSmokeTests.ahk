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
            SystemInformation.GetSystemTime(now := SYSTEMTIME())

            ; We don't have permission to set the system time
            Assert.Throws((*) => SystemInformation.SetSystemTime(now), OSError)
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