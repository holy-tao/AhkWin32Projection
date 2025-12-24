#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents a destination provider that can specify a filter to be used by the source provider during change enumeration.
 * @remarks
 * 
 * Typically, <b>IRequestFilteredSync</b> is implemented by a destination provider.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irequestfilteredsync
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRequestFilteredSync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRequestFilteredSync
     * @type {Guid}
     */
    static IID => Guid("{2e020184-6d18-46a7-a32a-da4aeb06696c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SpecifyFilter"]

    /**
     * When implemented by a derived class, negotiates which filter is used by the source provider during change enumeration.
     * @param {IFilterRequestCallback} pCallback The callback interface that is used by the destination provider to request that a filter be used by the source provider during change enumeration.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-irequestfilteredsync-specifyfilter
     */
    SpecifyFilter(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }
}
