#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of access that can be requested for graphics capture.
 * @remarks
 * Specify a member of this enumeration when calling [GraphicsCaptureAccess.RequestAccessAsync](graphicscaptureaccess_requestaccessasync_1551329835.md).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscaptureaccesskind
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCaptureAccessKind extends Win32Enum{

    /**
     * Access for borderless capture.
     * @type {Integer (Int32)}
     */
    static Borderless => 0

    /**
     * Access for programmatic capture.
     * @type {Integer (Int32)}
     */
    static Programmatic => 1
}
