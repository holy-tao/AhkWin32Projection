#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\ProviderType.ahk" { ProviderType }

/**
 * An application-defined function that is called by UI Automation to obtain a client-side provider for an element.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/nc-uiautomationcoreapi-uiaprovidercallback
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaProviderCallback {
    value : IntPtr

    __value {
        set {
            if (value is UiaProviderCallback) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window served by the provider.
     * @param {ProviderType} _providerType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-providertype">ProviderType</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ne-uiautomationcoreapi-providertype">ProviderType</a> enumerated type specifying the type of provider that is being requested.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> containing the requested provider.
     */
    Call(_hwnd, _providerType) {
        result := DllCall(this.value, HWND, _hwnd, ProviderType, _providerType, SAFEARRAY.Ptr)
        return result
    }

    /**
     * A UiaProviderCallback that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UiaProviderCallback {
        /**
         * Creates a UiaProviderCallback pointer that invokes the given AHK function when called.
         * @param {Func(HWND, ProviderType) => SAFEARRAY.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, ProviderType, SAFEARRAY.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
