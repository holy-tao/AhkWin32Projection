#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * \**PCMSCALLBACKA** (or **ApplyCallbackFunction**) is a callback function that you implement that updates the WCS configuration data while the dialog box displayed by the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function is executing.
 * @remarks
 * The **ApplyCallbackFunction** function is used to change the WCS configuration for a device while the Color Management dialog box is displayed. The Color Management dialog box is displayed by the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function.
 * 
 * If the callback function is provided, an **Apply** button is displayed in the lower right of the dialog box. When you select the **Apply** button, the callback function immediately updates the configuration for the device being set up. The Color Management dialog box remains on the screen.
 * 
 * An application supplies a callback function to WCS by storing the address of the callback function in the [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that is passed to the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function. The address is stored in the [**lPfnApplyCallback**](https://www.bing.com/search?q=**lPfnApplyCallback**) member of the **COLORMATCHSETUP** structure. The **dwFlags** member should be set to CMS\_USEAPPLYCALLBACK, or the callback function will be ignored.
 * 
 * A value supplied by the application may be passed to the callback function. Prior to invoking the [**SetupColorMatchingW**](/windows/win32/api/icm/nf-icm-setupcolormatchingw) function, the application can store a value in the [**lParamApplyCallback**](https://www.bing.com/search?q=**lParamApplyCallback**) member of the [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure. When the callback function is invoked, the value in the **lParamApplyCallback** structure member will be passed to the callback function in its *lParam* parameter.
 * 
 * The callback function is completely optional. If it is not supplied, the **Apply** button does not appear in the Color Management dialog box. Microsoft strongly recommends that your application supplies a callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/icm/nc-icm-pcmscallbacka
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class PCMSCALLBACKA extends IUnknown {

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
     * @param {Pointer<COLORMATCHSETUPA>} param0 
     * @param {LPARAM} param1 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "int")
        return result
    }
}
