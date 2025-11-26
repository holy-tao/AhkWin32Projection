#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPLibrary.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibraryServices interface provides methods to enumerate libraries.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibraryservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibraryServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPLibraryServices
     * @type {Guid}
     */
    static IID => Guid("{39c2f8d5-1cf2-4d5e-ae09-d73492cf9eaa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getCountByType", "getLibraryByType"]

    /**
     * The getCountByType method retrieves the count of available libraries of a specified type.
     * @param {Integer} wmplt <a href="https://docs.microsoft.com/windows/desktop/api/wmp/ne-wmp-wmplibrarytype">WMPLibraryType</a> enumeration value that specifies the type of library to count.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the library count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibraryservices-getcountbytype
     */
    getCountByType(wmplt, plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", wmplt, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getLibraryByType method retrieves a pointer to an IWMPLibrary interface that represents the library that has the specified type and index.
     * @param {Integer} wmplt <b>WMPLibraryType</b> enumeration value that specifies the type of library to retrieve.
     * @param {Integer} lIndex A <b>long</b> containing the index of the library to retrieve.
     * @returns {IWMPLibrary} Address of a variable that receives a pointer to the retrieved <b>IWMPLibrary</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibraryservices-getlibrarybytype
     */
    getLibraryByType(wmplt, lIndex) {
        result := ComCall(4, this, "int", wmplt, "int", lIndex, "ptr*", &ppIWMPLibrary := 0, "HRESULT")
        return IWMPLibrary(ppIWMPLibrary)
    }
}
