#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APO_FLAG.ahk" { APO_FLAG }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The APO_REG_PROPERTIES structure is used by IAudioProcessingObject::GetRegistrationProperties for returning the registration properties of an audio processing object (APO).
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apo_reg_properties
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_REG_PROPERTIES {
    #StructPack 8

    /**
     * The class ID for this APO.
     */
    clsid : Guid

    /**
     * The flags for this APO. This parameter is an enumerated constant of type <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ne-audioenginebaseapo-apo_flag">APO_FLAG</a>.
     */
    Flags : APO_FLAG

    /**
     * The friendly name of this APO. This is a string of characters with a max length of 256.
     */
    szFriendlyName : WCHAR[256]

    /**
     * The copyright info for this APO. This is a string of characters with a max length of 256.
     */
    szCopyrightInfo : WCHAR[256]

    /**
     * The major version number for this APO.
     */
    u32MajorVersion : UInt32

    /**
     * The minor version number for this APO.
     */
    u32MinorVersion : UInt32

    /**
     * The minimum number of input connections for this APO.
     */
    u32MinInputConnections : UInt32

    /**
     * The maximum number of input connections for this APO.
     */
    u32MaxInputConnections : UInt32

    /**
     * The minimum number of output connections for this APO.
     */
    u32MinOutputConnections : UInt32

    /**
     * The maximum number of output connections for this APO.
     */
    u32MaxOutputConnections : UInt32

    /**
     * The maximum number of instances of this APO.
     */
    u32MaxInstances : UInt32

    /**
     * The number of interfaces for this APO.
     */
    u32NumAPOInterfaces : UInt32

    iidAPOInterfaceList : IntPtr[1]

}
