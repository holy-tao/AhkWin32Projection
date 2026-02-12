#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GameSaveContainerInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveContainerInfoGetResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveContainerInfoGetResult
     * @type {Guid}
     */
    static IID => Guid("{ffc50d74-c581-4f9d-9e39-30a10c1e4c50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Value"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IVectorView<GameSaveContainerInfo>} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<GameSaveContainerInfo>} 
     */
    get_Value() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GameSaveContainerInfo, value)
    }
}
