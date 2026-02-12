#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumShellItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes enumeration of IShellItem interfaces. This interface is typically obtained by calling the IEnumShellItems method.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ienumshellitems
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumShellItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumShellItems
     * @type {Guid}
     */
    static IID => Guid("{70629033-e363-4a28-a567-0db78006e6d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Gets an array of one or more IShellItem interfaces from the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements in the array referenced by the <i>rgelt</i> parameter.
     * @param {Pointer<IShellItem>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interfaces that receive the enumerated item or items. The calling application is responsible for freeing the <b>IShellItem</b> interfaces by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to a value that receives the number of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interfaces successfully retrieved. The count can be smaller than the value specified in the <i>celt</i> parameter. This parameter can be <b>NULL</b> on entry only if <i>celt</i> is one, because in that case the method can only retrieve one item and return <b>S_OK</b>, or zero items and return <b>S_FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
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
     * if at least <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface was retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  if there are no more <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interfaces in the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * </td>
     * <td width="60%">
     * Returns an  error value if the function fails for any other reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ienumshellitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Skips a given number of IShellItem interfaces in the enumeration. Used when retrieving interfaces.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interfaces to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ienumshellitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the internal count of retrieved IShellItem interfaces in the enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ienumshellitems-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a copy of the current enumeration.
     * @returns {IEnumShellItems} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumshellitems">IEnumShellItems</a>**</b>
     * 
     * The address of a pointer that receives a copy of this enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ienumshellitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumShellItems(ppenum)
    }
}
