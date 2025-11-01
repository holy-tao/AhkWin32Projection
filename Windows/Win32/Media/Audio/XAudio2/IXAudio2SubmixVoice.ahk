#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXAudio2Voice.ahk

/**
 * A submix voice is used primarily for performance improvements and effects processing.
 * @remarks
 * 
  * Data buffers cannot be submitted directly to submix voices and will not be audible unless submitted to a mastering voice. A submix voice can be used to ensure that a particular set of voice data is converted to the same format and/or to have a particular effect chain processed on the collective result. 
  * 
  * 
  * IXAudio2SubmixVoice inherits directly from <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a>, but does not implement methods specific to submix voices. The interface type exists solely because some of the base class methods are implemented differently for submix voices. Having a separate type for these voices helps client code to distinguish the different voice types and to benefit from C++ type safety.
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/nn-xaudio2-ixaudio2submixvoice
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAudio2SubmixVoice extends IXAudio2Voice{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
