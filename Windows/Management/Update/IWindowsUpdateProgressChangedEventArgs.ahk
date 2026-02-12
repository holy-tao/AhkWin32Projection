#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsUpdate.ahk
#Include .\WindowsUpdateActionProgress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateProgressChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateProgressChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{bbfbdeeb-94c8-5aa7-b0fb-66c67c233b0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Update", "get_ActionProgress"]

    /**
     * @type {WindowsUpdate} 
     */
    Update {
        get => this.get_Update()
    }

    /**
     * @type {WindowsUpdateActionProgress} 
     */
    ActionProgress {
        get => this.get_ActionProgress()
    }

    /**
     * 
     * @returns {WindowsUpdate} 
     */
    get_Update() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdate(value)
    }

    /**
     * 
     * @returns {WindowsUpdateActionProgress} 
     */
    get_ActionProgress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsUpdateActionProgress(value)
    }
}
