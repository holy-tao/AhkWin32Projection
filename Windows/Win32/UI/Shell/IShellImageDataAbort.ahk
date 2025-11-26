#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a single method used to abort IShellImageData processes.
 * @remarks
 * 
 * This interface is not expected to be available in later versions of Windows. It is recommended that Windows GDI+ APIs be used in place of <a href="https://docs.microsoft.com/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a> methods.
 * 
 * This interface was not included in a public header file prior to Windows Vista.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nn-shimgdata-ishellimagedataabort
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellImageDataAbort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellImageDataAbort
     * @type {Guid}
     */
    static IID => Guid("{53fb8e58-50c0-4003-b4aa-0c8df28e7f3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryAbort"]

    /**
     * Aborts an IShellImageData process such as Decode, Draw, or Scale. This is a callback method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the <a href="/windows/desktop/api/shimgdata/nn-shimgdata-ishellimagedata">IShellImageData</a> process should continue, or S_FALSE if it should be aborted.
     * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nf-shimgdata-ishellimagedataabort-queryabort
     */
    QueryAbort() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
