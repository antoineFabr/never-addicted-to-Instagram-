import { getToken, JWT } from "next-auth/jwt";
import { NextRequest, NextResponse } from "next/server";
export async function middleware(req: NextRequest) {
  const url = req.nextUrl.pathname;

  if (!url.startsWith("/api")) {
    return NextResponse.json({ status: 404 });
  }

  return NextResponse.next();
}
export const config = {
  matcher: [
    "/((?!_next/static|manifest.json|sw.js|_next/image|error|denied|favicon.ico|image).*)",
  ],
};
