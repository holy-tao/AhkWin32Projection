#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDesktopWindowXamlSourceNative.ahk" { IDesktopWindowXamlSourceNative }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\UI\WindowsAndMessaging\MSG.ahk" { MSG }

/**
 * Provides a method that enables the WinRT XAML framework to process Windows messages for a **DesktopWindowXamlSource** object that hosts a WinRT XAML control.
 * @remarks
 * This interface is implemented by the [DesktopWindowXamlSource](/uwp/api/windows.ui.xaml.hosting.desktopwindowxamlsource) class. **DesktopWindowXamlSource** is a key component the [WinRT XAML hosting API](/windows/apps/desktop/modernize/using-the-xaml-hosting-api), which desktop apps can use to host WinRT XAML controls in any UI element that is associated with a window handle (this feature is also called *XAML Islands*).
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nn-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IDesktopWindowXamlSourceNative2 extends IDesktopWindowXamlSourceNative {
    /**
     * The interface identifier for IDesktopWindowXamlSourceNative2
     * @type {Guid}
     */
    static IID := Guid("{e3dcd8c7-3057-4692-99c3-7b7720afda31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDesktopWindowXamlSourceNative2 interfaces
    */
    struct Vtbl extends IDesktopWindowXamlSourceNative.Vtbl {
        PreTranslateMessage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDesktopWindowXamlSourceNative2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the WinRT XAML framework to process a Windows message for a **DesktopWindowXamlSource** object that hosts a WinRT XAML control.
     * @remarks
     * For a code example that demonstrates how to use this method, see [XamlBridge.cpp](https://github.com/microsoft/Xaml-Islands-Samples/blob/master/Samples/Win32/SampleCppApp/XamlBridge.cpp) in the SampleCppApp sample in the XAML Island samples repo.
     * @param {Pointer<MSG>} message Type: **const [MSG](/windows/win32/api/winuser/ns-winuser-msg)\***
     * 
     * The Windows message to process.
     * @param {Pointer<BOOL>} result Type: **BOOL\***
     * 
     * True if the message was processed; otherwise, false.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.desktopwindowxamlsource/nf-windows-ui-xaml-hosting-desktopwindowxamlsource-idesktopwindowxamlsourcenative2-pretranslatemessage
     */
    PreTranslateMessage(message, result) {
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, MSG.Ptr, message, resultMarshal, result, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDesktopWindowXamlSourceNative2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PreTranslateMessage := CallbackCreate(GetMethod(implObj, "PreTranslateMessage"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PreTranslateMessage)
    }
}
