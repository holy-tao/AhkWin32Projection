#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class PDXGK_FSTATE_NOTIFICATION extends IUnknown {

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
     * @param {Pointer<Void>} GraphicsDeviceHandle 
     * @param {Integer} ComponentIndex 
     * @param {Integer} NewFState 
     * @param {BOOLEAN} PreNotification 
     * @param {Pointer<Void>} PrivateHandle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(GraphicsDeviceHandle, ComponentIndex, NewFState, PreNotification, PrivateHandle) {
        GraphicsDeviceHandleMarshal := GraphicsDeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        ComCall(3, this, GraphicsDeviceHandleMarshal, GraphicsDeviceHandle, "uint", ComponentIndex, "uint", NewFState, "char", PreNotification, PrivateHandleMarshal, PrivateHandle)
    }
}
