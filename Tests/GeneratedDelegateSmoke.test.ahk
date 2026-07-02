#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Import ".\Yunit\Yunit.ahk" { Yunit }
#Import ".\YunitExtensions\Assert.ahk" { Assert }

#Import "../Windows/Win32/UI/WindowsAndMessaging/Apis.ahk" { EnumWindows }
#Import "../Windows/Win32/UI/WindowsAndMessaging/WNDENUMPROC.ahk" { WNDENUMPROC }
#Import "../Windows/Win32/UI/WindowsAndMessaging/WNDPROC.ahk" { WNDPROC }
#Import "../Windows/Win32/UI/WindowsAndMessaging/WNDCLASSW.ahk" { WNDCLASSW }

/**
 * Tests for delegates / function pointers (v2.1). A delegate (e.g. WNDENUMPROC, WNDPROC)
 * is emitted as a pointer-sized struct with:
 *  - a `.From(fn)` subclass that wraps an AHK function into a native callback via CallbackCreate,
 *  - a typed field/param specifier so structs and APIs that reference it marshal the pointer
 *    as the delegate class rather than a raw IntPtr.
 *
 * These tests avoid OS-version / system-configuration dependencies: EnumWindows always
 * enumerates the script's own top-level window (A_ScriptHwnd), and the `.From` and struct-field
 * cases are entirely in-process. State is kept in local objects captured by the callback closures
 * (Yunit reuses one instance per class, so instance fields would leak between tests).
 */
class GeneratedDelegateSmokeTests {

    /**
     * `.From` wraps an AHK function into a native callback pointer, and enforces arity.
     */
    class FunctionWrapper {

        From_Wraps_Callable_IntoPointer() {
            cb := WNDENUMPROC.From((hwnd, lparam) => 1)
            Assert.IsType(cb, WNDENUMPROC)
            Yunit.Assert(cb.value != 0, "Expected .From to produce a non-null callback pointer")
        }

        From_Throws_OnArityMismatch() {
            ; WNDENUMPROC.Invoke takes two parameters; a zero-arg function is not callable with two.
            Assert.Throws(() => WNDENUMPROC.From(() => 1), MethodError)
        }
    }

    /**
     * A delegate can be passed to a real API, whose DllCall type token is the delegate class.
     * EnumWindows synchronously invokes the callback once per top-level window.
     */
    class ApiCallback {

        EnumWindows_Invokes_Callback_ForScriptWindow() {
            state := { count: 0, foundSelf: false }
            cb := WNDENUMPROC.From((hwnd, lparam) => (
                state.count++,
                (hwnd.Value = A_ScriptHwnd ? state.foundSelf := true : 0),
                1   ; keep enumerating
            ))

            ret := EnumWindows(cb, 0)

            Yunit.Assert(state.count > 0, "Expected EnumWindows to invoke the callback at least once")
            Yunit.Assert(state.foundSelf, "Expected the enumeration to include the script's own window (A_ScriptHwnd)")
            Yunit.Assert(ret != 0, "Expected EnumWindows to report success")
        }

        Callback_Receives_TypedParams() {
            state := { hwndType: "", lparamType: "" }
            cb := WNDENUMPROC.From((hwnd, lparam) => (
                state.hwndType := Type(hwnd),
                state.lparamType := Type(lparam),
                0   ; one call is enough
            ))

            EnumWindows(cb, 0)

            ; The delegate's [HWND, LPARAM, BOOL] CallbackCreate spec boxes the params as typed values.
            Assert.Equals(state.hwndType, "HWND")
            Assert.Equals(state.lparamType, "LPARAM")
        }

        Callback_Receives_LParam_FromCaller() {
            sentinel := 0xBEEF
            state := { seen: 0 }
            cb := WNDENUMPROC.From((hwnd, lparam) => (state.seen := lparam.Value, 0))

            EnumWindows(cb, sentinel)

            Assert.Equals(state.seen, sentinel)   ; lParam round-trips through the API into the callback
        }

        Callback_Return_StopsEnumeration() {
            state := { count: 0 }
            ; Returning FALSE (0) from the first invocation must halt enumeration.
            cb := WNDENUMPROC.From((hwnd, lparam) => (state.count++, 0))

            EnumWindows(cb, 0)

            Assert.Equals(state.count, 1)   ; exactly one call before the BOOL return stops it
        }
    }

    /**
     * A delegate used as a struct field is typed as the delegate class, not a raw IntPtr.
     */
    class StructField {

        Field_Typed_AsDelegate() {
            wc := WNDCLASSW()
            proc := WNDPROC.From((hwnd, msg, wparam, lparam) => 0)

            wc.lpfnWndProc := proc

            Assert.IsType(wc.lpfnWndProc, WNDPROC)                  ; field reads back as the delegate type
            Assert.Equals(wc.lpfnWndProc.value, proc.value)        ; and stores the callback pointer
        }
    }
}
