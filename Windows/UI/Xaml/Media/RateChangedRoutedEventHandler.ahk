#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [RateChanged](../windows.ui.xaml.controls/mediaelement_ratechanged.md) event. This event fires when [PlaybackRate](../windows.ui.xaml.controls/mediaelement_playbackrate.md) or [DefaultPlaybackRate](../windows.ui.xaml.controls/mediaelement_defaultplaybackrate.md) change either via user interaction or from code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ratechangedroutedeventhandler
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RateChangedRoutedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for RateChangedRoutedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{08e9a257-ae05-489b-8839-28c6225d2349}")

    /**
     * The class identifier for RateChangedRoutedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{08e9a257-ae05-489b-8839-28c6225d2349}")

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
     * @param {IInspectable} sender 
     * @param {RateChangedRoutedEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
