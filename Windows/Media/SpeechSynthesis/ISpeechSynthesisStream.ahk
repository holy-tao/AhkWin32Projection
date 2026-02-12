#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\IMediaMarker.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechSynthesis
 * @version WindowsRuntime 1.4
 */
class ISpeechSynthesisStream extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechSynthesisStream
     * @type {Guid}
     */
    static IID => Guid("{83e46e93-244c-4622-ba0b-6229c4d0d65d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Markers"]

    /**
     * @type {IVectorView<IMediaMarker>} 
     */
    Markers {
        get => this.get_Markers()
    }

    /**
     * 
     * @returns {IVectorView<IMediaMarker>} 
     */
    get_Markers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IMediaMarker, value)
    }
}
