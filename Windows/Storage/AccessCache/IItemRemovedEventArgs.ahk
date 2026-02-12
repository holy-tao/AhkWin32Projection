#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AccessListEntry.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class IItemRemovedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemRemovedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{59677e5c-55be-4c66-ba66-5eaea79d2631}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemovedEntry"]

    /**
     * @type {AccessListEntry} 
     */
    RemovedEntry {
        get => this.get_RemovedEntry()
    }

    /**
     * 
     * @returns {AccessListEntry} 
     */
    get_RemovedEntry() {
        value := AccessListEntry()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
