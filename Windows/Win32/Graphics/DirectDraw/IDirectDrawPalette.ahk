#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawPalette interface to create DirectDrawPalette objects and work with system-level variables. This section is a reference to the methods of this interface.
 * @remarks
 * 
 * The methods of the <b>IDirectDrawPalette</b> interface can be organized into the following groups:<table>
 * <tr>
 * <th>Group</th>
 * <th>Methods</th>
 * </tr>
 * <tr>
 * <td>Allocating memory</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawpalette-initialize">Initialize</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Palette capabilities</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawpalette-getcaps">GetCaps</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Palette entries</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawpalette-getentries">GetEntries</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawpalette-setentries">SetEntries</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * You can use the LPDIRECTDRAWPALETTE data type to declare a variable that contains a pointer to an <b>IDirectDrawPalette</b> interface. The Ddraw.h header file declares the data type with the following code:
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDrawPalette    FAR *LPDIRECTDRAWPALETTE;
 * 
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/nn-ddraw-idirectdrawpalette
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawPalette extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawPalette
     * @type {Guid}
     */
    static IID => Guid("{6c14db84-a733-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetEntries", "Initialize", "SetEntries"]

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-getcaps
     */
    GetCaps(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<PALETTEENTRY>} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-getentries
     */
    GetEntries(param0, param1, param2, param3) {
        result := ComCall(4, this, "uint", param0, "uint", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDirectDraw} param0 
     * @param {Integer} param1 
     * @param {Pointer<PALETTEENTRY>} param2 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(param0, param1, param2) {
        result := ComCall(5, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<PALETTEENTRY>} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-setentries
     */
    SetEntries(param0, param1, param2, param3) {
        result := ComCall(6, this, "uint", param0, "uint", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }
}
