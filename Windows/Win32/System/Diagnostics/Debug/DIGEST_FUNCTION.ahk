#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * An application-defined callback function used by the ImageGetDigestStream function to process data.
 * @remarks
 * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/imagehlp/nc-imagehlp-digest_function
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DIGEST_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} refdata 
     * @param {Pointer<Integer>} pData 
     * @param {Integer} dwLength 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(refdata, pData, dwLength) {
        refdataMarshal := refdata is VarRef ? "ptr" : "ptr"
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, refdataMarshal, refdata, pDataMarshal, pData, "uint", dwLength, "int")
        return result
    }
}
