#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapImage3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapImage3
     * @type {Guid}
     */
    static IID => Guid("{f1de6f26-3c73-453f-a7ba-9b85c18b3733}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAnimatedBitmap", "get_IsPlaying", "get_AutoPlay", "put_AutoPlay", "Play", "Stop"]

    /**
     * @type {Boolean} 
     */
    IsAnimatedBitmap {
        get => this.get_IsAnimatedBitmap()
    }

    /**
     * @type {Boolean} 
     */
    IsPlaying {
        get => this.get_IsPlaying()
    }

    /**
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnimatedBitmap() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaying() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Play method plays the current DVD title.
     * @remarks
     * If playback is paused or stopped and [**EnableResetOnStop**](enableresetonstop-property.md) is true, then calling **Play** will resume playback at normal speed at the current location. If playback is stopped and **EnableResetOnStop** is false, then calling **Play** will cause the disc to start playing at the beginning of the first title.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/play-method
     */
    Play() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
