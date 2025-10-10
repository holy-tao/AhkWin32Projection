#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINTS.ahk

/**
 * Stores information about a gesture.
 * @remarks
 * 
  * The <b>HIDWORD</b> of the <b>ullArguments</b> member is always 0, with the following exceptions:
  * 
  * <ul>
  * <li>For <b>GID_PAN</b>, it is 0 except when there is inertia. When <b>GF_INERTIA</b> is set,  the <b>HIDWORD</b> is an inertia vector (two 16-bit values).</li>
  * <li>For <b>GID_PRESSANDTAP</b>, it is the distance between the two points.</li>
  * </ul>
  * The <b>GESTUREINFO</b> structure is retrieved by passing the handle to the gesture information structure
  *   to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getgestureinfo">GetGestureInfo</a> function.
  * 
  * The following flags indicate the various states of the gestures and are stored in <b>dwFlags</b>.
  *   
  * 
  * <table>
  * <tr>
  * <th>Name</th>
  * <th>Value</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>GF_BEGIN</td>
  * <td>0x00000001</td>
  * <td>A gesture is starting.</td>
  * </tr>
  * <tr>
  * <td>GF_INERTIA</td>
  * <td>0x00000002</td>
  * <td>A gesture has triggered inertia.</td>
  * </tr>
  * <tr>
  * <td>GF_END</td>
  * <td>0x00000004</td>
  * <td>A gesture has finished.</td>
  * </tr>
  * </table>
  *  
  * 
  * <div class="alert"><b>Note</b>  Most applications should ignore the <b>GID_BEGIN</b> and <b>GID_END</b> messages and pass them to <b>DefWindowProc</b>.  
  *   These messages are used by the default gesture handler. Application behavior is undefined when
  *   the <b>GID_BEGIN</b> and <b>GID_END</b> messages are consumed by a third-party application.</div>
  * <div> </div>
  * The following table indicates the various identifiers for gestures.
  *   
  * 
  * <table>
  * <tr>
  * <th>Name</th>
  * <th>Value</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td><b>GID_BEGIN</b></td>
  * <td>1</td>
  * <td>A gesture is starting.</td>
  * </tr>
  * <tr>
  * <td><b>GID_END</b></td>
  * <td>2</td>
  * <td>A gesture is ending.</td>
  * </tr>
  * <tr>
  * <td><b>GID_ZOOM</b></td>
  * <td>3</td>
  * <td>The zoom gesture.</td>
  * </tr>
  * <tr>
  * <td><b>GID_PAN</b></td>
  * <td>4</td>
  * <td>The pan gesture.</td>
  * </tr>
  * <tr>
  * <td><b>GID_ROTATE</b></td>
  * <td>5</td>
  * <td>The rotation gesture.</td>
  * </tr>
  * <tr>
  * <td><b>GID_TWOFINGERTAP</b></td>
  * <td>6</td>
  * <td>The two-finger tap gesture.</td>
  * </tr>
  * <tr>
  * <td><b>GID_PRESSANDTAP</b></td>
  * <td>7</td>
  * <td>The press and tap gesture.</td>
  * </tr>
  * </table>
  *  
  * 
  * <div class="alert"><b>Note</b>  The <b>GID_PAN</b> gesture has built-in inertia.  At the end of a pan gesture, additional pan
  *     gesture messages are created by the operating system.
  *     </div>
  * <div> </div>
  * The following type is defined to represent a constant pointer to a <b>GESTUREINFO</b> structure.
  * 
  * 
  * ```cpp
  * 
  *     typedef GESTUREINFO const * PCGESTUREINFO;	 
  * 
  * ```
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-gestureinfo
 * @namespace Windows.Win32.UI.Input.Touch
 * @version v4.0.30319
 */
class GESTUREINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(GESTUREINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the gesture.  For additional information, see Remarks.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the gesture command.
     * @type {Integer}
     */
    dwID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A handle to the window that is targeted by this gesture.
     * @type {Pointer<Void>}
     */
    hwndTarget {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <b>POINTS</b> structure containing the coordinates associated with the gesture. These coordinates are always relative to the origin of the screen.
     * @type {POINTS}
     */
    ptsLocation{
        get {
            if(!this.HasProp("__ptsLocation"))
                this.__ptsLocation := POINTS(this.ptr + 24)
            return this.__ptsLocation
        }
    }

    /**
     * An internally used identifier for the structure.
     * @type {Integer}
     */
    dwInstanceID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * An internally used identifier for the sequence.
     * @type {Integer}
     */
    dwSequenceID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A 64-bit unsigned integer that contains the arguments for gestures that fit into 8 bytes.
     * @type {Integer}
     */
    ullArguments {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size, in bytes, of extra arguments that accompany this gesture.
     * @type {Integer}
     */
    cbExtraArgs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}
