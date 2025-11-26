#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SHCOLUMNINFO.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the addition of custom columns in the Windows Explorer Details view.
 * @remarks
 * 
 * The Windows Explorer Details view typically displays several standard columns. Each column lists information, such as the file size or type, for each file in the current folder. There can also be a number of columns that the user can choose to display. When the user right-clicks one of the column headers, a list of the available columns is displayed in a dialog box. By creating a column provider object that exports the <b>IColumnProvider</b> interface, you can add custom columns to that dialog box for display by Windows Explorer. For example, a collection of files that contain music could use a column provider to display columns listing the artist and piece contained by each file.
 * 
 * A column provider is a global object that is called every time Windows Explorer displays the Details view. Windows Explorer queries all registered column providers for their column characteristics. If the user has selected one of the column provider's columns, Windows Explorer queries the column provider for the associated data for each file in the folder. It then displays all the selected columns.
 * 
 * Typically, column providers are used to display one or more custom columns for a particular <a href="https://docs.microsoft.com/windows/desktop/shell/fa-file-types">file type</a>. When a column provider receives a request for data, it provides it if the file is a member of its supported type. Otherwise, it ignores the request by returning S_FALSE.
 * 
 * Columns are identified by an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that contains an <b>fmtid</b>/<b>pid</b> pair. If possible, use existing <b>fmtid</b>s and <b>pid</b>s. If a folder contains files of more than one file type, the data from different types can be merged into the same column. For instance, the Author <b>pid</b> from the summary information property set can be used for a wide variety of purposes. If you use a custom <b>SHCOLUMNID</b> structure, the column will display data only for those files that are members of the supported type. If the folder contains other files, their entries will be blank.
 * 
 * Implement an object that exports this interface when you want to have one or more custom columns displayed in the Windows Explorer Details view. Windows Explorer calls the interface methods to request the information it needs to display the column. The procedure used by Windows Explorer is as follows:
 * 		
 *         		
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-icolumnprovider-initialize">IColumnProvider::Initialize</a> to specify the folder to display.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-icolumnprovider-getcolumninfo">IColumnProvider::GetColumnInfo</a> to retrieve the column's characteristics.</li>
 * <li>If the column has been selected by the user, call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-icolumnprovider-getitemdata">IColumnProvider::GetItemData</a> for each file in the folder to retrieve the data that belongs in the file's column entry.</li>
 * </ol>
 * In addition to normal Component Object Model (COM) registration, the column provider object must also be registered with Windows Explorer. To do so, add a subkey named with the string form of the object's GUID to this key.
 * 		
 *         		<pre xml:space="preserve"><b>HKEY_CLASSES_ROOT</b>
 *    <b>Folder</b>
 *       <b>shellex</b>
 *          <b>ColumnHandlers</b></pre>
 * 
 * 
 * This interface is called by Windows Explorer. It is not typically used by applications.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-icolumnprovider
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IColumnProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColumnProvider
     * @type {Guid}
     */
    static IID => Guid("{e8025004-1c42-11d2-be2c-00a0c9a83da1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetColumnInfo", "GetItemData"]

    /**
     * Initializes an IColumnProvider interface.
     * @param {Pointer<SHCOLUMNINIT>} psci Type: <b>LPCSHCOLUMNINIT</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-shcolumninit">SHCOLUMNINIT</a> structure with initialization information, including the folder whose contents are to be displayed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-icolumnprovider-initialize
     */
    Initialize(psci) {
        result := ComCall(3, this, "ptr", psci, "HRESULT")
        return result
    }

    /**
     * Requests information about a column.
     * @param {Integer} dwIndex Type: <b>DWORD</b>
     * 
     * The column's zero-based index. It is an arbitrary value that is used to enumerate columns.
     * @returns {SHCOLUMNINFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-shcolumninfo">SHCOLUMNINFO</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-shcolumninfo">SHCOLUMNINFO</a> structure to hold the column information.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-icolumnprovider-getcolumninfo
     */
    GetColumnInfo(dwIndex) {
        psci := SHCOLUMNINFO()
        result := ComCall(4, this, "uint", dwIndex, "ptr", psci, "HRESULT")
        return psci
    }

    /**
     * Requests column data for a specified file.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>LPCSHCOLUMNID</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that identifies the column.
     * @param {Pointer<SHCOLUMNDATA>} pscd Type: <b>LPCSHCOLUMNDATA</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-shcolumndata">SHCOLUMNDATA</a> structure that specifies the file.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * A pointer to a <b>VARIANT</b> with the data for the file specified by <i>pscd</i> that belongs in the column specified by <i>pscid</i>. Set this value if the file is a member of the class supported by the column provider.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-icolumnprovider-getitemdata
     */
    GetItemData(pscid, pscd) {
        pvarData := VARIANT()
        result := ComCall(5, this, "ptr", pscid, "ptr", pscd, "ptr", pvarData, "HRESULT")
        return pvarData
    }
}
