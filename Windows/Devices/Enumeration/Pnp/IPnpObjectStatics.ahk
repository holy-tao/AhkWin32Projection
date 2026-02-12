#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\PnpObject.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PnpObjectCollection.ahk
#Include .\PnpObjectWatcher.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration.Pnp
 * @version WindowsRuntime 1.4
 */
class IPnpObjectStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPnpObjectStatics
     * @type {Guid}
     */
    static IID => Guid("{b3c32a3d-d168-4660-bbf3-a733b14b6e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromIdAsync", "FindAllAsync", "FindAllAsyncAqsFilter", "CreateWatcher", "CreateWatcherAqsFilter"]

    /**
     * 
     * @param {Integer} type 
     * @param {HSTRING} id 
     * @param {IIterable<HSTRING>} requestedProperties 
     * @returns {IAsyncOperation<PnpObject>} 
     */
    CreateFromIdAsync(type, id, requestedProperties) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "int", type, "ptr", id, "ptr", requestedProperties, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PnpObject, asyncOp)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {IIterable<HSTRING>} requestedProperties 
     * @returns {IAsyncOperation<PnpObjectCollection>} 
     */
    FindAllAsync(type, requestedProperties) {
        result := ComCall(7, this, "int", type, "ptr", requestedProperties, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PnpObjectCollection, asyncOp)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {IIterable<HSTRING>} requestedProperties 
     * @param {HSTRING} aqsFilter 
     * @returns {IAsyncOperation<PnpObjectCollection>} 
     */
    FindAllAsyncAqsFilter(type, requestedProperties, aqsFilter) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(8, this, "int", type, "ptr", requestedProperties, "ptr", aqsFilter, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PnpObjectCollection, asyncOp)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {IIterable<HSTRING>} requestedProperties 
     * @returns {PnpObjectWatcher} 
     */
    CreateWatcher(type, requestedProperties) {
        result := ComCall(9, this, "int", type, "ptr", requestedProperties, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PnpObjectWatcher(watcher)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {IIterable<HSTRING>} requestedProperties 
     * @param {HSTRING} aqsFilter 
     * @returns {PnpObjectWatcher} 
     */
    CreateWatcherAqsFilter(type, requestedProperties, aqsFilter) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(10, this, "int", type, "ptr", requestedProperties, "ptr", aqsFilter, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PnpObjectWatcher(watcher)
    }
}
