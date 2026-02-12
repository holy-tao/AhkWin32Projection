#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackagePropertySetView3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackagePropertySetView3
     * @type {Guid}
     */
    static IID => Guid("{db764ce5-d174-495c-84fc-1a51f6ab45d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnterpriseId"]

    /**
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
