#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FaceDetectionEffectFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IFaceDetectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaceDetectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{19918426-c65b-46ba-85f8-13880576c90a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResultFrame"]

    /**
     * @type {FaceDetectionEffectFrame} 
     */
    ResultFrame {
        get => this.get_ResultFrame()
    }

    /**
     * 
     * @returns {FaceDetectionEffectFrame} 
     */
    get_ResultFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FaceDetectionEffectFrame(value)
    }
}
