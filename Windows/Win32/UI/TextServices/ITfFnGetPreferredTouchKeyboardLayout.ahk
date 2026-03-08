#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnGetPreferredTouchKeyboardLayout interface is implemented by a text service to specify the use of a particular keyboard layout supported by the inbox Windows 8 touch keyboard.
 * @remarks
 * For more information on the layouts which can be specified, see GetLayout.
 * 
 * This interface applies only to IMEs written using the Text Services Framework and not to legacy IMM32 IMEs, and it only applies to the following input languages:
 * 
 * <ul>
 * <li>Japanese</li>
 * <li>Korean</li>
 * <li>Simplified Chinese</li>
 * <li>Traditional Chinese</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffngetpreferredtouchkeyboardlayout
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnGetPreferredTouchKeyboardLayout extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnGetPreferredTouchKeyboardLayout
     * @type {Guid}
     */
    static IID => Guid("{5f309a41-590a-4acc-a97f-d8efff13fdfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLayout"]

    /**
     * Obtains the touch keyboard layout identifier of the layout that the IME directs the touch keyboard to show while the IME is active.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tkblayouttype">TKBLayoutType</a> is an enumeration with the following values.
     * 
     * <table>
     * <tr>
     * <td>TKBLT_UNDEFINED</td>
     * <td>Undefined.</td>
     * </tr>
     * <tr>
     * <td>TKBLT_CLASSIC</td>
     * <td>
     * The touch keyboard is to use a classic layout.
     * 
     * Classic layouts represent the legacy layouts of physical keyboards.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>TKBLT_OPTIMIZED</td>
     * <td>
     * The touch keyboard is to use a touch-optimized layout.
     * 
     * Touch-optimized layouts have been specifically designed with touch in mind.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The layout identifiers returned by this API must be one from the following list.
     * Each identifier is specific to a certain language, and these are all specific to the touch keyboard.
     * There is no way to request support for other layouts, or to add new touch optimized layouts dynamically.
     * 
     * <table>
     * <tr>
     * <th>Layout Definition                                                                                    </th>
     * <th>Value</th>
     * <th>Supported Input Language</th>
     * </tr>
     * <tr>
     * <td>TKBL_UNDEFINED</td>
     * <td>0</td>
     * <td>n/a</td>
     * </tr>
     * <tr>
     * <td>TKBL_CLASSIC_TRADITIONAL_CHINESE_PHONETIC</td>
     * <td>0x0404</td>
     * <td>CHT</td>
     * </tr>
     * <tr>
     * <td>TKBL_CLASSIC_TRADITIONAL_CHINESE_CHANGJIE</td>
     * <td>0xF042</td>
     * <td>CHT</td>
     * </tr>
     * <tr>
     * <td>TKBL_CLASSIC_TRADITIONAL_CHINESE_DAYI</td>
     * <td>0xF043</td>
     * <td>CHT</td>
     * </tr>
     * <tr>
     * <td>TKBL_OPT_JAPANESE_ABC</td>
     * <td>0x0411</td>
     * <td>JPN</td>
     * </tr>
     * <tr>
     * <td>TKBL_OPT_KOREAN_HANGUL_2_BULSIK</td>
     * <td>0x0412</td>
     * <td>KOR</td>
     * </tr>
     * <tr>
     * <td>TKBL_OPT_SIMPLIFIED_CHINESE_PINYIN</td>
     * <td>0x0804</td>
     * <td>CHS</td>
     * </tr>
     * <tr>
     * <td>TKBL_OPT_TRADITIONAL_CHINESE_PHONETIC</td>
     * <td>0x0404</td>
     * <td>CHT</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pwPreferredLayoutId Pointer to a <b>WORD</b> value that receives the layout identifier.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tkblayouttype">TKBLayoutType</a> enumeration that receives the layout type.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffngetpreferredtouchkeyboardlayout-getlayout
     */
    GetLayout(pwPreferredLayoutId) {
        pwPreferredLayoutIdMarshal := pwPreferredLayoutId is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "int*", &pTKBLayoutType := 0, pwPreferredLayoutIdMarshal, pwPreferredLayoutId, "HRESULT")
        return pTKBLayoutType
    }
}
