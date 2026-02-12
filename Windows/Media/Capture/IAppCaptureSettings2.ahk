#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AppCaptureAlternateShortcutKeys.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureSettings2
     * @type {Guid}
     */
    static IID => Guid("{fcb8cee7-e26b-476f-9b1a-ec342d2a8fde}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsGpuConstrained", "get_AlternateShortcutKeys"]

    /**
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * @type {AppCaptureAlternateShortcutKeys} 
     */
    AlternateShortcutKeys {
        get => this.get_AlternateShortcutKeys()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppCaptureAlternateShortcutKeys} 
     */
    get_AlternateShortcutKeys() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCaptureAlternateShortcutKeys(value)
    }
}
