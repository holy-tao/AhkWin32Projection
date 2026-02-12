#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PDEBUG_STACK_PROVIDER_RECONSTRUCTSTACK extends IUnknown {

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
     * @param {Integer} SystemThreadId 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} NativeFrames 
     * @param {Integer} CountNativeFrames 
     * @param {Pointer<Pointer<STACK_SYM_FRAME_INFO>>} StackSymFrames 
     * @param {Pointer<Integer>} StackSymFramesFilled 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SystemThreadId, NativeFrames, CountNativeFrames, StackSymFrames, StackSymFramesFilled) {
        StackSymFramesMarshal := StackSymFrames is VarRef ? "ptr*" : "ptr"
        StackSymFramesFilledMarshal := StackSymFramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", SystemThreadId, "ptr", NativeFrames, "uint", CountNativeFrames, StackSymFramesMarshal, StackSymFrames, StackSymFramesFilledMarshal, StackSymFramesFilled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
