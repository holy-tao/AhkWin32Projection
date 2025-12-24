#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumExplorerCommand.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provided by an IExplorerCommandProvider. This interface contains the enumeration of commands to be put into the command bar.
 * @remarks
 * 
 * None of the methods of this interface should talk to network resources. They are called on the UI thread; communicating with network resources would cause the UI to stop responding.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumexplorercommand
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumExplorerCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumExplorerCommand
     * @type {Guid}
     */
    static IID => Guid("{a88826f8-186f-4987-aade-ea0cef8fbfe8}")

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
     * Retrieves a specified number of elements that directly follow the current element.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of elements to fetch.
     * @param {Pointer<IExplorerCommand>} pUICommand Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommand">IExplorerCommand</a>**</b>
     * 
     * Address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iexplorercommand">IExplorerCommand</a> interface pointer array of <i>celt</i> elements that, when this method returns, is an array of pointers to the retrieved elements.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * When this method returns, contains a pointer to the number of elements actually retrieved. This pointer can be <b>NULL</b> if this information is not needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumexplorercommand-next
     */
    Next(celt, pUICommand, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", pUICommand, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * Not currently implemented.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Currently unused.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumexplorercommand-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration to 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumexplorercommand-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not currently implemented.
     * @returns {IEnumExplorerCommand} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand">IEnumExplorerCommand</a>**</b>
     * 
     * Currently unused.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ienumexplorercommand-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExplorerCommand(ppenum)
    }
}
