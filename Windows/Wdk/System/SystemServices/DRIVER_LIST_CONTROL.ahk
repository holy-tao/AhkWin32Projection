#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DRIVER_LIST_CONTROL extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Pointer<IRP>} Irp_ 
     * @param {Pointer<SCATTER_GATHER_LIST>} ScatterGather 
     * @param {Pointer<Void>} Context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(DeviceObject, Irp_, ScatterGather, Context_) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", DeviceObject, "ptr", Irp_, "ptr", ScatterGather, Context_Marshal, Context_)
    }
}
