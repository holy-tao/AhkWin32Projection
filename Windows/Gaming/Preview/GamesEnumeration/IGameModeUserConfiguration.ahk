#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class IGameModeUserConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameModeUserConfiguration
     * @type {Guid}
     */
    static IID => Guid("{72d34af4-756b-470f-a0c2-ba62a90795db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GamingRelatedProcessNames", "SaveAsync"]

    /**
     * @type {IVector<HSTRING>} 
     */
    GamingRelatedProcessNames {
        get => this.get_GamingRelatedProcessNames()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_GamingRelatedProcessNames() {
        result := ComCall(6, this, "ptr*", &processNames := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), processNames)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
