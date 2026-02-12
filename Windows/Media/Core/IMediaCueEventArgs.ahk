#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMediaCue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaCueEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCueEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d12f47f7-5fa4-4e68-9fe5-32160dcee57e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Cue"]

    /**
     * @type {IMediaCue} 
     */
    Cue {
        get => this.get_Cue()
    }

    /**
     * 
     * @returns {IMediaCue} 
     */
    get_Cue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaCue(value)
    }
}
