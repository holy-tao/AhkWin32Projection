#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\SpatialEntityWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialEntityStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialEntityStore
     * @type {Guid}
     */
    static IID => Guid("{329788ba-e513-4f06-889d-1be30ecf43e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveAsync", "RemoveAsync", "CreateEntityWatcher"]

    /**
     * 
     * @param {SpatialEntity} entity 
     * @returns {IAsyncAction} 
     */
    SaveAsync(entity) {
        result := ComCall(6, this, "ptr", entity, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {SpatialEntity} entity 
     * @returns {IAsyncAction} 
     */
    RemoveAsync(entity) {
        result := ComCall(7, this, "ptr", entity, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @returns {SpatialEntityWatcher} 
     */
    CreateEntityWatcher() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialEntityWatcher(value)
    }
}
