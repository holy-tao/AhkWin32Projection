#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnGetPreferredTouchKeyboardLayout interface is implemented by a text service to specify the use of a particular keyboard layout supported by the inbox Windows 8 touch keyboard.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffngetpreferredtouchkeyboardlayout
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnGetPreferredTouchKeyboardLayout extends ITfFunction{
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
     * The GetLayout function returns the layout of a device context (DC).
     * @param {Pointer<Int32>} pTKBLayoutType 
     * @param {Pointer<UInt16>} pwPreferredLayoutId 
     * @returns {HRESULT} If the function succeeds, it returns the layout flags for the current device context.
     * 
     * If the function fails, it returns GDI_ERROR. For extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getlayout
     */
    GetLayout(pTKBLayoutType, pwPreferredLayoutId) {
        result := ComCall(4, this, "int*", pTKBLayoutType, "ushort*", pwPreferredLayoutId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
