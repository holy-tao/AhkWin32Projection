#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WHV_REGISTER_VALUE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_EMULATOR_GET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} Context_ 
     * @param {Pointer<Integer>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @returns {WHV_REGISTER_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Context_, RegisterNames, RegisterCount) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"
        RegisterNamesMarshal := RegisterNames is VarRef ? "int*" : "ptr"

        RegisterValues := WHV_REGISTER_VALUE()
        result := ComCall(3, this, Context_Marshal, Context_, RegisterNamesMarshal, RegisterNames, "uint", RegisterCount, "ptr", RegisterValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RegisterValues
    }
}
