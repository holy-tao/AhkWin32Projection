#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPObject.ahk

/**
 * Windows Media Device Manager uses IMDSPObject2 to enable more efficient file reading and writing.Note  Unless the service provider has added the device parameter UseExtendedWmdm with a value of 1, Windows Media Device Manager will not call this interface. See Device Parameters for more information about this. .
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspobject2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPObject2 extends IMDSPObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPObject2
     * @type {Guid}
     */
    static IID => Guid("{3f34cd3e-5907-4341-9af9-97f4187c3aa5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadOnClearChannel", "WriteOnClearChannel"]

    /**
     * The ReadOnClearChannel method reads data from the object at the current position without using secure authenticated channels.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> specifying the number of bytes of data to read. Upon return, this parameter contains the actual amount of data read.
     * @returns {Integer} Pointer to a buffer to receive the data read from the object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject2-readonclearchannel
     */
    ReadOnClearChannel(pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "char*", &pData := 0, pdwSizeMarshal, pdwSize, "HRESULT")
        return pData
    }

    /**
     * The WriteOnClearChannel method writes data to the object to the current position within the object, without using secure authenticated channels.
     * @param {Pointer<Integer>} pData Pointer to the buffer containing the data to write to the object.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> containing the number of bytes of data to write. Upon return, this parameter contains the actual number of bytes written.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspobject2-writeonclearchannel
     */
    WriteOnClearChannel(pData, pdwSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
