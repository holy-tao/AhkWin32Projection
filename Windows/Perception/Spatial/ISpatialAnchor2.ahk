#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchor2
     * @type {Guid}
     */
    static IID => Guid("{ed17c908-a695-4cf6-92fd-97263ba71047}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemovedByUser"]

    /**
     * @type {Boolean} 
     */
    RemovedByUser {
        get => this.get_RemovedByUser()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RemovedByUser() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
