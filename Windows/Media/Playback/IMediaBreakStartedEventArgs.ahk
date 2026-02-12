#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaBreak.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaBreakStartedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBreakStartedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{a87efe71-dfd4-454a-956e-0a4a648395f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MediaBreak"]

    /**
     * @type {MediaBreak} 
     */
    MediaBreak {
        get => this.get_MediaBreak()
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_MediaBreak() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaBreak(value)
    }
}
