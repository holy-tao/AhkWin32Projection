#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ICreateAudioDeviceOutputNodeResult2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateAudioDeviceOutputNodeResult2
     * @type {Guid}
     */
    static IID => Guid("{4864269f-bdce-4ab1-bd38-fbae93aedaca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedError"]

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
