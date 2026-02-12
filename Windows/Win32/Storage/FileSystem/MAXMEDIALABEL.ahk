#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The MaxMediaLabel callback function determines the maximum size of the media label for the applications supported by the media label library.
 * @remarks
 * When the media format of the media specified in the 
 * <i>MaxMediaLabel</i> function does not have a theoretical size limit, the application should return the size of the largest media label the application can possibly generate.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntmsmli/nc-ntmsmli-maxmedialabel
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class MAXMEDIALABEL extends IUnknown {

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
     * @param {Pointer<Integer>} pMaxSize 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pMaxSize) {
        pMaxSizeMarshal := pMaxSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pMaxSizeMarshal, pMaxSize, "uint")
        return result
    }
}
