#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\PROPSHEETPAGEA.ahk" { PROPSHEETPAGEA }
#Import ".\PSPCB_MESSAGE.ahk" { PSPCB_MESSAGE }

/**
 * Specifies an application-defined callback function that a property sheet calls when a page is created and when it is about to be destroyed. An application can use this function to perform initialization and cleanup operations for the page. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/prsht/nc-prsht-lpfnpspcallbacka
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct LPFNPSPCALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is LPFNPSPCALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Reserved; must be <b>NULL</b>.
     * @param {PSPCB_MESSAGE} uMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @param {Pointer<PROPSHEETPAGEA>} ppsp Type: <b>LPPROPSHEETPAGE</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure that defines the page being created or destroyed. See the Remarks section for further discussion.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The return value depends on the value of the <i>uMsg</i> parameter.
     */
    Call(_hwnd, uMsg, ppsp) {
        result := DllCall(this.value, HWND, _hwnd, PSPCB_MESSAGE, uMsg, PROPSHEETPAGEA.Ptr, ppsp, UInt32)
        return result
    }

    /**
     * A LPFNPSPCALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNPSPCALLBACKA {
        /**
         * Creates a LPFNPSPCALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PSPCB_MESSAGE, PROPSHEETPAGEA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PSPCB_MESSAGE, PROPSHEETPAGEA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
