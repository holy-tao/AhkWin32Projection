#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Specifies an application-defined callback function that a property sheet calls when a page is created and when it is about to be destroyed. An application can use this function to perform initialization and cleanup operations for the page. (Unicode)
 * @remarks
 * An application must specify the address of this callback function in the <b>pfnCallback</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure before passing the structure to the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> function.
 * 
 * <div class="alert"><b>Note</b>  The property sheet is in the process of manipulating the list of pages when this function is called. Do not attempt to add, remove, or insert pages while handling this notification. Doing so will have unpredictable results.</div>
 * <div> </div>
 * With the exception of the <b>lParam</b> member, your application should not modify the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure. Doing so will have unpredictable results. The <b>lParam</b> member contains application-defined data and can be modified as needed.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The prsht.h header defines LPFNPSPCALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/prsht/nc-prsht-lpfnpspcallbackw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class LPFNPSPCALLBACKW extends IUnknown {

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
     * @param {HWND} hwnd_ 
     * @param {Integer} uMsg 
     * @param {Pointer<PROPSHEETPAGEW>} ppsp 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwnd_, uMsg, ppsp) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(3, this, "ptr", hwnd_, "uint", uMsg, "ptr", ppsp, "uint")
        return result
    }
}
