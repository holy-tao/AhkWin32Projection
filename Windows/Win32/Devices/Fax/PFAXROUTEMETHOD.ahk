#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxRouteMethod function is a placeholder for a function name defined by the fax routing extension DLL. This function executes a defined fax routing procedure.
 * @remarks
 * A fax routing method can manipulate the received Tagged Image File Format Class F (TIFF Class F) file. For example, one routing method could route the received Tagged Image File Format (TIFF) file to a specific destination such as a printer, or deliver the file in an email message to a user. Another routing method could convert the TIFF file to text using optical character recognition (OCR) technology, and then create a Microsoft Word document from the text. A fax routing method cannot delete or modify the TIFF file. For information about TIFF files, see <a href="https://msdn.microsoft.com/d7840c10-6059-40ed-9040-50eefefc7349">Fax Image Format</a>..
 * 
 * If you want the fax service to retry a failed routing method at a later time, the fax routing method must take the following steps.
 * 
 * <h3><a id="To_specify_that_the_fax_service_retry_a_fax_routing_method"></a><a id="to_specify_that_the_fax_service_retry_a_fax_routing_method"></a><a id="TO_SPECIFY_THAT_THE_FAX_SERVICE_RETRY_A_FAX_ROUTING_METHOD"></a>To specify that the fax service retry a fax routing method</h3>
 * <ol>
 * <li>Allocate a buffer to hold retry information for the fax routing method. The fax routing method must allocate the memory required for the buffer from the heap specified by the <a href="https://docs.microsoft.com/windows/win32/api/faxroute/nf-faxroute-faxrouteinitialize">FaxRouteInitialize</a> function.</li>
 * <li>Fill <i></i>the buffer with the information required to retry the fax routing method.</li>
 * <li>Set the <i>FailureData</i> parameter of the <b>FaxRouteMethod</b> function to a valid pointer value.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api//content/faxroute/nc-faxroute-pfaxroutemethod
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXROUTEMETHOD extends IUnknown {

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
     * @param {Pointer<FAX_ROUTE>} param0 
     * @param {Pointer<Pointer<Void>>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "int")
        return result
    }
}
