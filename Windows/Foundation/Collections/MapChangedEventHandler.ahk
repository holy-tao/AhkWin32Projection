#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles the changed event of an observable map.
 * @remarks
 * This delegate is used by the [PropertySet.MapChanged](propertyset_mapchanged.md) event and the [IObservableMap.MapChanged](iobservablemap_2_mapchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.mapchangedeventhandler-2
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class MapChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for MapChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{179517f3-94ee-41f8-bddc-768a895544f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IObservableMap<Generic, Generic>} sender 
     * @param {IMapChangedEventArgs<Generic>} event 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, event) {
        result := ComCall(3, this, "ptr", sender, "ptr", event, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
