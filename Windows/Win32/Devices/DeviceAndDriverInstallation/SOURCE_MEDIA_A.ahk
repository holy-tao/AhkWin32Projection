#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SOURCE_MEDIA structure is used with the SPFILENOTIFY_NEEDMEDIA notification to pass source media information. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SOURCE_MEDIA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-source_media_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct SOURCE_MEDIA_A {
    #StructPack 8

    /**
     * This member is not currently used.
     */
    Reserved : PSTR

    /**
     * Optional  tag file that can be used to identify the source media.
     */
    Tagfile : PSTR

    /**
     * Human-readable description of the source media.
     */
    Description : PSTR

    /**
     * Path to the source that needs the new media.
     */
    SourcePath : PSTR

    /**
     * Source file to be retrieved from the new media.
     */
    SourceFile : PSTR

    Flags : UInt32

}
