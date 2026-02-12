#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PTERMINATION_HANDLER extends IUnknown {

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
     * @param {BOOLEAN} _abnormal_termination 
     * @param {Pointer<Void>} EstablisherFrame 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(_abnormal_termination, EstablisherFrame) {
        EstablisherFrameMarshal := EstablisherFrame is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "char", _abnormal_termination, EstablisherFrameMarshal, EstablisherFrame)
    }
}
