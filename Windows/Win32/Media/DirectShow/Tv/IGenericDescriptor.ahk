#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-igenericdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGenericDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGenericDescriptor
     * @type {Guid}
     */
    static IID => Guid("{6a5918f8-a77a-4f61-aed0-5702bdcda3e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTag", "GetLength", "GetBody"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Pointer<Integer>} pbDesc Pointer to a buffer that contains the raw descriptor data.
     * @param {Integer} bCount Specifies the size of the buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_ALREADY_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MPEG2_E_MALFORMED_TABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid or malformed descriptor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-igenericdescriptor-initialize
     */
    Initialize(pbDesc, bCount) {
        pbDescMarshal := pbDesc is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbDescMarshal, pbDesc, "int", bCount, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Integer} Receives the tag.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-igenericdescriptor-gettag
     */
    GetTag() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Integer} Receives the length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-igenericdescriptor-getlength
     */
    GetLength() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {Pointer<Integer>} Receives a pointer to a buffer. To get the size of the buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/mpeg2psiparser/nf-mpeg2psiparser-igenericdescriptor-getlength">IGenericDescriptor::GetLength</a> method. The buffer contains the body of the descriptor, in network byte order (Big Endian). The caller is responsible for converting the data to Little Endian byte order. The caller must free the buffer by calling the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nf-mpeg2psiparser-igenericdescriptor-getbody
     */
    GetBody() {
        result := ComCall(6, this, "ptr*", &ppbVal := 0, "HRESULT")
        return ppbVal
    }
}
