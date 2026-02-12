#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents an individual vertex in a hand mesh vertex buffer.
 * @remarks
 * This vertex position and normal is expressed relative to the coordinate system returned by the [HandMeshVertexState](handmeshvertexstate.md) object's [CoordinateSystem](handmeshvertexstate_coordinatesystem.md) property.  Each frame, you must always get the new vertices and then locate their new coordinate system to accurately position the hand mesh in the world.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshvertex
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HandMeshVertex extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The position of the vertex.
     * @type {Pointer<Vector3>}
     */
    Position {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The normal of the vertex.
     * @type {Pointer<Vector3>}
     */
    Normal {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
