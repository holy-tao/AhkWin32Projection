#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\IDirectDraw.ahk
#Include ..\Gdi\PALETTEENTRY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawPalette interface to create DirectDrawPalette objects and work with system-level variables. This section is a reference to the methods of this interface.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nn-ddraw-idirectdrawpalette
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class IDirectDrawPalette extends IUnknown {

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
     * Retrieves the capabilities of the palette object.
     * @param {Pointer<Integer>} param0 A pointer to a variable that receives a value from the <b>dwPalCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/ns-ddraw-ddcaps_dx3">DDCAPS</a> structure that defines palette capabilities. This value consists of one or more of the following flags.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-getcaps
     */
    GetCaps(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Retrieves palette values from a DirectDrawPalette object.
     * @param {Integer} param0 Currently not used and must be set to 0.
     * @param {Integer} param1 Start of the entries to be retrieved sequentially.
     * @param {Integer} param2 Number of palette entries that can fit in the array that <i>lpEntries</i> specifies. The colors of the palette entries are returned in sequence, from the value of the <i>dwStartingEntry</i> parameter through the value of the <i>dwCount</i> parameter minus 1. (These parameters are set by <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawpalette-setentries">IDirectDrawPalette::SetEntries</a>.)
     * @param {Pointer<PALETTEENTRY>} param3 An array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures that receives the palette entries from the DirectDrawPalette object. The palette entries are 1 byte each if the DDPCAPS_8BITENTRIES flag is set, and 4 bytes otherwise. Each field is a color description.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTPALETTIZED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-getentries
     */
    GetEntries(param0, param1, param2, param3) {
        result := ComCall(4, this, "uint", param0, "uint", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Initializes the DirectDrawPalette object.
     * @param {IDirectDraw} param0 A pointer to the DirectDraw object to associate with the DirectDrawPalette object.
     * @param {Integer} param1 Currently not used and must be set to 0.
     * @param {Pointer<PALETTEENTRY>} param2 Currently not used and must be set to NULL.
     * @returns {HRESULT} This method returns DDERR_ALREADYINITIALIZED.
     * 
     * This method is provided for compliance with the Component Object Model (COM). Because the DirectDrawPalette object is initialized when it is created, this method always returns DDERR_ALREADYINITIALIZED.
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-initialize
     */
    Initialize(param0, param1, param2) {
        result := ComCall(5, this, "ptr", param0, "uint", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * Changes entries in a DirectDrawPalette object immediately.
     * @param {Integer} param0 Currently not used and must be set to 0.
     * @param {Integer} param1 First entry to be set.
     * @param {Integer} param2 Number of palette entries to be changed.
     * @param {Pointer<PALETTEENTRY>} param3 An array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures that contains the palette entries that <b>SetEntries</b> uses to change the DirectDrawPalette object. The palette entries are 1 byte each if the DDPCAPS_8BITENTRIES flag is set, and 4 bytes otherwise. Each field is a color description.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOPALETTEATTACHED</li>
     * <li>DDERR_NOTPALETTIZED</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawpalette-setentries
     */
    SetEntries(param0, param1, param2, param3) {
        result := ComCall(6, this, "uint", param0, "uint", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }
}
