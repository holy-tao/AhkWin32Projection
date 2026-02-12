#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Reads a value when WS_TYPEhas been specified.
 * @remarks
 * The callback will be invoked with the same calling sequence as
 *                 <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsreadtype">WsReadType</a> in the documentation for <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type_mapping">WS_TYPE_MAPPING</a>.
 *                 This defines what parts of the XML that the callback should read.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_read_type_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_READ_TYPE_CALLBACK extends IUnknown {

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
     * @param {Pointer<WS_XML_READER>} reader 
     * @param {Integer} typeMapping 
     * @param {Pointer<Void>} descriptionData 
     * @param {Pointer<WS_HEAP>} heap 
     * @param {Pointer} value 
     * @param {Integer} valueSize 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(reader, typeMapping, descriptionData, heap, value, valueSize, error) {
        descriptionDataMarshal := descriptionData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", reader, "int", typeMapping, descriptionDataMarshal, descriptionData, "ptr", heap, "ptr", value, "uint", valueSize, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
