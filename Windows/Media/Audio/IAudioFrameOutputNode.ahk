#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\AudioFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioFrameOutputNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioFrameOutputNode
     * @type {Guid}
     */
    static IID => Guid("{b847371b-3299-45f5-88b3-c9d12a3f1cc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrame"]

    /**
     * The GetFrame function returns a handle to a given frame within a capture.
     * @remarks
     * Use the **GetFrame** function to obtain the frame handle needed when locating instances of a property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) which locates the first instance, and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) which locates the next instance.
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetFrame** function.
     * @returns {AudioFrame} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/getframe
     */
    GetFrame() {
        result := ComCall(6, this, "ptr*", &audioFrame_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioFrame(audioFrame_)
    }
}
