#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * When implemented by a derived class, represents an object that can convert an ISyncProvider object to an IKnowledgeSyncProvider object.
 * @remarks
 * 
 * <b>IProviderConverter</b> is typically implemented by the developer of the custom provider that it converts.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iproviderconverter
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IProviderConverter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProviderConverter
     * @type {Guid}
     */
    static IID => Guid("{809b7276-98cf-4957-93a5-0ebdd3dddffd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * When implemented by a derived class, initializes the IProviderConverter object with the ISyncProvider object to be converted to IKnowledgeSyncProvider.
     * @param {ISyncProvider} pISyncProvider The <b>ISyncProvider</b> object to be converted.
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
     * <dt><b>Converter-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-iproviderconverter-initialize
     */
    Initialize(pISyncProvider) {
        result := ComCall(3, this, "ptr", pISyncProvider, "HRESULT")
        return result
    }
}
