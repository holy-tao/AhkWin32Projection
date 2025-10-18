#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class DesktopSharing {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_OPEN => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_CLOSE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SETSHAREDRECT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_GETSHAREDRECT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_VIEWERCONNECT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_VIEWERDISCONNECT => 105

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_TERMINATE_CONNECTION => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_CREATE_INVITATION => 107

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_REQUEST_CONTROL => 108

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_CREATE => 109

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SEND_DATA => 110

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_VIRTUAL_CHANNEL_SET_ACCESS => 111

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_PAUSE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_RESUME => 113

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SHOW_WINDOW => 114

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_REQUEST_COLOR_DEPTH_CHANGE => 115

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STARTREVCONNECTLISTENER => 116

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_CONNECTTOCLIENT => 117

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SET_RENDERING_SURFACE => 118

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SEND_MOUSE_BUTTON_EVENT => 119

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SEND_MOUSE_MOVE_EVENT => 120

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SEND_MOUSE_WHEEL_EVENT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SEND_KEYBOARD_EVENT => 122

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SEND_SYNC_EVENT => 123

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_BEGIN_TOUCH_FRAME => 124

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_ADD_TOUCH_INPUT => 125

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_END_TOUCH_FRAME => 126

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_CONNECTUSINGTRANSPORTSTREAM => 127

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_SENDCONTROLLEVELCHANGERESPONSE => 148

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_GETFRAMEBUFFERBITS => 149

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_DISPIDVALUE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_ID => 201

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_SESSION_PROPERTIES => 202

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_ATTENDEES => 203

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_INVITATIONS => 204

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_INVITATION => 205

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_CHANNELMANAGER => 206

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETNAME => 207

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETFLAGS => 208

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_VIRTUAL_CHANNEL_GETPRIORITY => 209

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_WINDOWID => 210

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPLICATION => 211

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_WINDOWSHARED => 212

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_WINDOWNAME => 213

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPNAME => 214

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPLICATION_FILTER => 215

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_WINDOW_LIST => 216

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPLICATION_LIST => 217

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPFILTER_ENABLED => 218

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPFILTERENABLED => 219

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_SHARED => 220

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_INVITATIONITEM => 221

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_DBG_CLX_CMDLINE => 222

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_APPFLAGS => 223

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_WNDFLAGS => 224

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_PROTOCOL_TYPE => 225

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_LOCAL_PORT => 226

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_LOCAL_IP => 227

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_PEER_PORT => 228

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_PEER_IP => 229

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_ATTENDEE_FLAGS => 230

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_CONINFO => 231

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_CONNECTION_STRING => 232

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_GROUP_NAME => 233

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_PASSWORD => 234

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_ATTENDEELIMIT => 235

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_REVOKED => 236

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_DISCONNECTED_STRING => 237

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_USESMARTSIZING => 238

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_SESSION_COLORDEPTH => 239

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_REASON => 240

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_CODE => 241

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_CTRL_LEVEL => 242

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_REMOTENAME => 243

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_COUNT => 244

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_FRAMEBUFFER_HEIGHT => 251

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_FRAMEBUFFER_WIDTH => 252

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_FRAMEBUFFER_BPP => 253

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_FRAMEBUFFER => 254

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_CONNECTED => 301

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_DISCONNECTED => 302

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_ATTENDEE_UPDATE => 303

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_ERROR => 304

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTED => 305

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIEWER_DISCONNECTED => 306

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIEWER_AUTHENTICATED => 307

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIEWER_CONNECTFAILED => 308

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_REQUEST => 309

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_PAUSED => 310

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_GRAPHICS_STREAM_RESUMED => 311

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_JOIN => 312

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_LEAVE => 313

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_DATARECEIVED => 314

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_VIRTUAL_CHANNEL_SENDCOMPLETED => 315

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_APPLICATION_OPEN => 316

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_APPLICATION_CLOSE => 317

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_APPLICATION_UPDATE => 318

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_WINDOW_OPEN => 319

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_WINDOW_CLOSE => 320

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_WINDOW_UPDATE => 321

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_APPFILTER_UPDATE => 322

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_SHARED_RECT_CHANGED => 323

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_FOCUSRELEASED => 324

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_SHARED_DESKTOP_SETTINGS_CHANGED => 325

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_CTRLLEVEL_CHANGE_RESPONSE => 338

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPAPI_EVENT_ON_BOUNDING_RECT_CHANGED => 340

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAM_ALLOCBUFFER => 421

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAM_FREEBUFFER => 422

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAMSENDDATA => 423

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAMREADDATA => 424

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAMOPEN => 425

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_METHOD_STREAMCLOSE => 426

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORAGE => 555

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADSIZE => 558

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_PAYLOADOFFSET => 559

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_CONTEXT => 560

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_FLAGS => 561

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_PROP_STREAMBUFFER_STORESIZE => 562

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_STREAM_SENDCOMPLETED => 632

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_STREAM_DATARECEIVED => 633

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_ON_STREAM_CLOSED => 634

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_BUTTON_RECEIVED => 700

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_MOVE_RECEIVED => 701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_RDPSRAPI_EVENT_VIEW_MOUSE_WHEEL_RECEIVED => 702
;@endregion Constants

;@region Methods
;@endregion Methods
}
